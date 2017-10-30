//
//  OnboardingViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 27.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import UserNotifications
import paper_onboarding
import Lottie

class OnboardingViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate{

    @IBOutlet weak var onboardingView: Onboarding!
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    //Instanze von NotCenter machen und Optionen bestimmen
    let center = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    //Animation
    let checkedAnimationView = LOTAnimationView(name: "checked_done_")
    let allowNotificationsView = LOTAnimationView(name: "notification_request")
    let machineAnimation = LOTAnimationView(name: "pink_drink_machine")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Daten Herkunft bestimmen
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    //Angeben wieviele Onboarding Seiten es gibt
    func onboardingItemsCount() -> Int {
        return 4
    }
    //Seiten definieren
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        //Farben
        let onboardColor1 = UIColor(red: 207/255, green: 103/255, blue: 118/255, alpha: 1.0)
        let onboardColor2 = UIColor(red: 48/255, green: 65/255, blue: 93/255, alpha: 1.0)
        let onboardColor3 = UIColor(red: 175/255, green: 193/255, blue: 250/255, alpha: 1.0)
        let onboardColor4 = UIColor(red: 142/255, green: 171/255, blue: 222/255, alpha: 1.0)
        
        //Fonts
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 23.0)!
        let descriptionFont = UIFont(name: "AvenirNext-Medium", size: 18.0)!
        //Return im erforderten Format
        return [("", "Willkommen bei Pro Chemistry!", "Diese App ist als Projektarbeit am Gymnasium Oberwil entstanden.", "", onboardColor1, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("", "Chemie war noch nie so einfach!", "Mithilfe von ProChemistry hast du wichtiges Wissen unter deinen Fingerspitzen!", "", onboardColor2, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("", "", "", "", onboardColor3, UIColor.white, UIColor.white, titleFont, descriptionFont),
                ("", "Viel Spass!", "", "", onboardColor4, UIColor.white, UIColor.white, titleFont, descriptionFont)][index]
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {}
    
    //Falls wieder zurück gescrollt wird, Buttons ausblenden
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 2  {
            if self.letsGoButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.letsGoButton.alpha = 0
                    self.checkedAnimationView.alpha = 0
                    
                })
            }
        } else if index == 1 || index == 3 {
            if self.notificationButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: { 
                    self.notificationButton.alpha = 0
                    self.allowNotificationsView.stop()
                    self.allowNotificationsView.alpha = 0
                })
            }
        }
    }
    
    //Falls bei letzter Seite angekommen "Lets Go" Button einblenden
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 1 {
            
            machineAnimation.alpha = 1
            machineAnimation.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
            machineAnimation.contentMode = .scaleAspectFit
            self.view.addSubview(machineAnimation)
            machineAnimation.play()
            
        }
        if index == 2 {
            UIView.animate(withDuration: 0.3, animations: {
                self.notificationButton.alpha = 1
            })
            
            allowNotificationsView.alpha = 1
            allowNotificationsView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 400)
            allowNotificationsView.contentMode = .scaleToFill
            self.view.addSubview(allowNotificationsView)
            allowNotificationsView.play(toProgress: 0.95, withCompletion: nil)
            
            let btn: UIButton = UIButton(frame: CGRect(x: 223, y: 321.333, width: 50, height: 40))
            btn.addTarget(self, action: #selector(notificationSetup(_:)), for: .touchUpInside)
            self.view.addSubview(btn)

        } else if index == 3 {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.letsGoButton.alpha = 1.0
            })

            checkedAnimationView.alpha = 1
            checkedAnimationView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
            checkedAnimationView.contentMode = .scaleAspectFill
            self.view.addSubview(checkedAnimationView)
            checkedAnimationView.play()
        }
    }
    
    @IBAction func letsGo(_ sender: Any) {
        //Eintrag in UserDefaults damit man Onboarding nur 1 mal sieht
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "onboardComplete")
        userDefaults.synchronize()
    }
    
    @IBAction func notificationSetup(_ sender: Any) {
        center.requestAuthorization(options: options) { (granted, error) in
            print("notfication setup done")
        }
    }
}
