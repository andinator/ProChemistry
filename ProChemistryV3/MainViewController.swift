//
//  MainViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 23.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import NotificationCenter

class MainViewController: UIViewController {

    @IBOutlet weak var button: MenuButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.adjustsImageWhenHighlighted = false;
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSettings), name: NSNotification.Name("settingsVC"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showMolCalculator), name: NSNotification.Name("MolCalculator"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAnimations), name: NSNotification.Name("Animations"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showDebugArea), name: NSNotification.Name("DebugArea"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showLearning), name: NSNotification.Name("showLearningVC"), object: nil)
        
    }
    
    
    
    //  MARK: Segues
    @objc func showMolCalculator() {
        performSegue(withIdentifier: "molCalculator", sender: nil)
    }
    
    @objc func showAnimations() {
        performSegue(withIdentifier: "animations", sender: nil)
    }
    
    @objc func showDebugArea() {
        performSegue(withIdentifier: "debugArea", sender: nil)
    }
    
    @objc func showSettings() {
        print("test")
        performSegue(withIdentifier: "showMenu", sender: nil)
    }
    
    @objc func showLearning() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let learningVC = sb.instantiateViewController(withIdentifier: "LearningVC") as! LearningViewController
        self.present(learningVC, animated: true, completion: nil)

    }

   

    @IBAction func showMenu(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }


}
