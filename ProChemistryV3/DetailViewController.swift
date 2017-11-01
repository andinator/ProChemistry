//
//  DetailViewController.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 30.10.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var elementLink:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: elementLink!)!
        let request = URLRequest(url: url)
        self.webView.load(request)
        
    }
}
