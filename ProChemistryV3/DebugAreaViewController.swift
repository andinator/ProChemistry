//
//  DebugAreaViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 27.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import UserNotifications

class DebugAreaViewController: UIViewController {

    let center = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func resetdfl(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "onboardComplete")
        userDefaults.synchronize()
    }

    @IBAction func testNotification(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "ProChemistry"
        content.body = "Test Notification!"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        let identifier = "Test Notification"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
    }
}
