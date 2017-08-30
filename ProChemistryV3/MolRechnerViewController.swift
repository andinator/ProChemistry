//
//  MolRechnerViewController.swift
//  ProChemistryV2
//
//  Created by Andi Felder on 05.03.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import UIKit
import CoreData

class MolRechnerViewController: UIViewController {

//MARK: Outlets
    @IBOutlet weak var summenformelEingabe: UITextField!
    @IBOutlet weak var grammEingabe: UITextField!
    @IBOutlet weak var molEingabe: UITextField!
    @IBOutlet weak var ergebnisTextView: UITextView!
    
    
    let molCalculatorBrain = MolCalculatorBrain()
    var managedObjectContext:NSManagedObjectContext!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    
    //MARK: Actions
    
    @IBAction func rechnePressed(_ sender: UIButton) {
        
        var ergebnis = 0.0
        
        if let summenformel = summenformelEingabe.text, !summenformel.isEmpty, let testGramm = grammEingabe.text, !testGramm.isEmpty {
            guard let testGramm = grammEingabe.text, let gramm = Double(testGramm) else { alert(message: "Bitte eine Zahl eingeben!"); return}
            molCalculatorBrain.calculateMol(summenformelFromUser: summenformel, gewicht: gramm)
            ergebnis = molCalculatorBrain.result
        } else if let summenformel = summenformelEingabe.text, !summenformel.isEmpty, let test1 = molEingabe.text, !test1.isEmpty {
            guard let test2 = molEingabe.text, let mol = Double(test2) else { alert(message: "Bitte eine Zahl eingeben!"); return }
            molCalculatorBrain.calculateGrammFromSummenformel(summenformelFromUser: summenformel, molFromUser: mol)
            ergebnis = molCalculatorBrain.result
        } else {
            alert(message: "Bitte alle Nötigen Werte eingeben!")
        }
        
        ergebnisTextView.text = String(ergebnis)
    }
    
}
//Credit: https://goo.gl/XwscKb
extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
