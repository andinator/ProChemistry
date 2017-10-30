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
    @IBOutlet weak var untertitelLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var animationView: UIView!
    
    var headerString:String? {
        didSet {
            configureText()
        }
    }
    
    var untertitelString:String? {
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
        untertitelLabel.text = untertitelString
        textView.text = mainText
    }
    
    func configureAnimation() {
        animationV!.frame = CGRect(x: 0, y: 100, width: animationView.frame.size.width, height: 250)
        animationV!.contentMode = .scaleAspectFill
        self.view.addSubview(animationV!)
        animationV!.play(toProgress: 0.99, withCompletion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
