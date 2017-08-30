//
//  Helpers.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 25.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String, title: String = "ProChemistry") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
