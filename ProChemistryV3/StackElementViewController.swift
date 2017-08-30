//
//  StackElementViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 30.08.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import Lottie

class StackElementViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var animationView: UIView!
    
    var headerString:String? {
        didSet {
            configureText()
        }
    }
    
    var mainText: String? {
        didSet {
            configureText()
        }
    }
    
    var animationV: LOTAnimationView? {
        didSet {
            configureAnimation()
        }
    }
    
    func configureText() {
        headerLabel.text = headerString
        textView.text = mainText
    }
    
    func configureAnimation() {
        animationView.addSubview(animationV!)
        animationV!.loopAnimation = true
        animationV!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
