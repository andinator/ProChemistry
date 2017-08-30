//
//  MolCalculatorBrain.swift
//  ProChemistryV2
//
//  Created by Andi Felder on 05.03.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import Foundation

class MolCalculatorBrain
{
    private var ergebnis = 0.0
    private var quantityarray = [String]()
    
    private var elementeDatenbank: Dictionary<String,Double> = [
        "H" : 1.0,
        "C" : 12.0,
        "N" : 14.0,
        "O" : 16.0,
        "Na" : 23.0,
        "Cl" : 35
    ]
    
    public func calculateMol(summenformelFromUser:String, gewicht: Double) {
        let splittedString = splitString(summenformel: summenformelFromUser)
        let analyzedString = analyzeSummenformel(summenformel: splittedString)
        ergebnis = calculateMolareMasse(molareMassen: analyzedString, gewicht: gewicht)
    }
    
    public func calculateGrammFromSummenformel(summenformelFromUser: String, molFromUser: Double) {
        let splittedString = splitString(summenformel: summenformelFromUser)
        let analyzedString = analyzeSummenformel(summenformel: splittedString)
        ergebnis = calculateGramm(molareMassen: analyzedString, molFromUser: molFromUser)
    }
    
    private func splitString(summenformel: String) -> [String]{
        let string = summenformel
        
        var elementearray = [String]()
        
        let pattern = "([A-Z]([a-z]+)?)(\\d+)?"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
        for match in matches {
            let elementRange = match.rangeAt(1)
            let element = (string as NSString).substring(with: elementRange)
            elementearray.append(element)
            let quantityRange = match.rangeAt(3)
            var quantity = "1"
            if quantityRange.location != NSNotFound {
                quantity = (string as NSString).substring(with: quantityRange)
            }
            quantityarray.append(quantity)
        }
        return elementearray
    }
    
    private func analyzeSummenformel(summenformel: [String]) -> [Double]{
        var molMassen: Array<Double> = []
        for i in summenformel{
            if let elementMolareMasse = elementeDatenbank[i]{
                molMassen.append(elementMolareMasse)
            }
        }
        return molMassen
    }
    
    private func calculateMolareMasse(molareMassen: [Double], gewicht: Double) -> Double{
        var rechnung = 0.0
        for (index,value) in molareMassen.enumerated(){
            rechnung += value * Double(quantityarray[index])!
            print("There are \(quantityarray[index]) \(value) molecules")
        }
        
        rechnung = gewicht / rechnung
        quantityarray = []
        return rechnung
    }
    
    private func calculateGramm(molareMassen: [Double], molFromUser: Double) -> Double{
        var rechnung = 0.0
        for (index,value) in molareMassen.enumerated(){
            rechnung += value * Double(quantityarray[index])!
            print("There are \(quantityarray[index]) \(value) molecules")
        }
        rechnung = molFromUser/rechnung
        return rechnung
    }
    
    var result: Double {
        get {
            return ergebnis
        }
    }
}
