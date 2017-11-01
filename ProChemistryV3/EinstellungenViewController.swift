//
//  EinstellungenViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 31.10.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import Lottie

class EinstellungenViewController: UIViewController {
    
    //STEP 1 propeties
    var menuOn = false
    var menuButton: LOTAnimationView?
    var itemButtonFrame = CGRect(x: 0, y: 70, width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addMenuButton(self.menuOn)
    }
    
    //STEP 2 add gesture recognizer every time a new menubutton is created
    func addToggleRecognizer(_ animationView: LOTAnimationView) {
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleMenu(recognizer:)))
        animationView.addGestureRecognizer(tapRecognizer)
        
    }
    
    //STEP 3 reset state
    func addMenuButton(_ on: Bool) {
        
        //if exists reset the state to nil
        if menuButton != nil {
            self.menuButton?.removeFromSuperview()
            self.menuButton = nil
        }
        
        let animation = menuOn ? "buttonOn" : "buttonOff"
        menuButton = LOTAnimationView(name: animation)
        guard let menuButton = menuButton else {
            return
        }
        menuButton.isUserInteractionEnabled = true
        menuButton.frame = itemButtonFrame
        menuButton.contentMode = .scaleAspectFill
        
        addToggleRecognizer(menuButton)
        view.addSubview(menuButton)
    }
    
    
    
    //STEP 4 perform toggle interaction
    @objc func toggleMenu(recognizer: UITapGestureRecognizer) {
        
        menuOn ? setMenuOffAndPerformAction() : setMenuOnAndPerformAction()
    }
    
    func setMenuOnAndPerformAction() {
        menuButton?.play(completion: { (success) in
            
            self.menuOn = true
            self.addMenuButton(self.menuOn)
            DispatchQueue.main.async {
                print("menu is ON")
                //update UI on main thread
            }        })
    }
    
    func setMenuOffAndPerformAction() {
        
        menuButton?.play(completion: { (success) in
            self.menuOn = false
            self.addMenuButton(self.menuOn)
            DispatchQueue.main.async {
                print("menu is OFF")
                //update UI on main thread
            }
        })
    }
}
