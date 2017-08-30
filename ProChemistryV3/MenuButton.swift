//
//  MenuButton.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 26.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit

class MenuButton: UIButtonX {
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        UIView.animate(withDuration: 0.3){
            if self.transform == .identity {
                self.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
            } else {
                self.transform = .identity
            }
        }
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }

}
