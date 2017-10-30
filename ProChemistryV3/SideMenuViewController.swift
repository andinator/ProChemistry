//
//  SideMenuViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 23.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch indexPath.row {
            case 0: NotificationCenter.default.post(name: NSNotification.Name("MolCalculator"), object: nil)
            case 1: NotificationCenter.default.post(name: NSNotification.Name("Animations"), object: nil)
            case 2: NotificationCenter.default.post(name: NSNotification.Name("DebugArea"), object: nil)
            case 3: NotificationCenter.default.post(name: NSNotification.Name("showLearningVC"), object: nil)
            case 4: NotificationCenter.default.post(name: NSNotification.Name("settingsVC"), object: nil)
            case 5: NotificationCenter.default.post(name: NSNotification.Name("elementeVC"), object: nil)
            default: print("not found!")
        }
    }
}
