//
//  AnimationViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 25.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import Lottie

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let test = LOTAnimatedSwitch(named: "toggle_switch")
        test.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 100)
        test.setOn(true, animated: true)
        self.view.addSubview(test)
        
    }
    @IBAction func animationPressed(_ sender: Any) {
        let animationView = LOTAnimationView(name: "checked_done_")
        animationView.frame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 250)
        animationView.contentMode = .scaleAspectFill
        animationView.loopAnimation = true
        
        self.view.addSubview(animationView)
        
        animationView.play()
    }

    

}
