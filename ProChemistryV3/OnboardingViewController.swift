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
    //Return im erforderten Format
    return [("", "Willkommen bei Pro Chemistry!", "Diese App ist als Projektarbeit am Gymnasium Oberwil entstanden.", "", constants.onboarding.color1, UIColor.white, UIColor.white, constants.onboarding.titleFont, constants.onboarding.descriptionFont),
            ("", "Chemie war noch nie so einfach!", "Mithilfe von ProChemistry hast du wichtiges Wissen unter deinen Fingerspitzen!", "", constants.onboarding.color2, UIColor.white, UIColor.white, constants.onboarding.titleFont, constants.onboarding.descriptionFont),
            ("", "", "", "", constants.onboarding.color3, UIColor.white, UIColor.white, constants.onboarding.titleFont, constants.onboarding.descriptionFont),
            ("", "Viel Spass!", "", "", constants.onboarding.color4, UIColor.white, UIColor.white, constants.onboarding.titleFont, constants.onboarding.descriptionFont)][index]
    }
    
   @objc func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {}
    
    //Falls wieder zurück gescrollt wird, Buttons ausblenden
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 2  {
            if self.letsGoButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.letsGoButton.alpha = 0
                    constants.animations.checkedAnimation.alpha = 0
                    
                })
            }
        } else if index == 1 || index == 3 {
            if self.notificationButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: { 
                    self.notificationButton.alpha = 0
                    constants.animations.notificationAnimation.stop()
                    constants.animations.notificationAnimation.alpha = 0
                })
            }
        }
    }
    
    //Falls bei letzter Seite angekommen "Lets Go" Button einblenden
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 1 {}
        if index == 2 {
            UIView.animate(withDuration: 0.3, animations: {
                self.notificationButton.alpha = 1
            })
            constants.animations.notificationAnimation.alpha = 1
            constants.animations.notificationAnimation.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 400)
            constants.animations.notificationAnimation.contentMode = .scaleToFill
            self.view.addSubview(constants.animations.notificationAnimation)
            constants.animations.notificationAnimation.play(toProgress: 0.95, withCompletion: nil)
            let btn: UIButton = UIButton(frame: CGRect(x: 223, y: 321.333, width: 50, height: 40))
            btn.addTarget(self, action: #selector(notificationSetup(_:)), for: .touchUpInside)
            self.view.addSubview(btn)

        } else if index == 3 {
            self.letsGoButton.alpha = 1
            UIView.animate(withDuration: 0.3, animations: {
                self.letsGoButton.alpha = 1.0
            })
            constants.animations.checkedAnimation.alpha = 1
            constants.animations.checkedAnimation.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
            constants.animations.checkedAnimation.contentMode = .scaleAspectFill
            self.view.addSubview(constants.animations.checkedAnimation)
            constants.animations.checkedAnimation.play()
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
