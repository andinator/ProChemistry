//
//  DetailViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 30.10.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var elementInfoLabel: UILabel!
    @IBOutlet weak var lableText: UILabel!
    
    var userText:String?
    var elementInfo:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        lableText.text = userText
        elementInfoLabel.text = elementInfo
    }
}
