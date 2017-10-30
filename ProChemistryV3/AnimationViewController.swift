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

        // Do any additional setup after loading the view.
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
