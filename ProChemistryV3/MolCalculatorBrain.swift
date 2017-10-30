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
        "He" : 4.0,
        "Li" : 6.94,
        "Be" : 9.01,
        "B" : 11.81,
        "C" : 12.0,
        "N" : 14.0,
        "O" : 16.0,
        "F" : 18.99,
        "Ne" : 20.18,
        "Na" : 23.0,
        "Mg" : 24.305,
        "Al" : 26.98,
        "Si" : 28.0,
        "P" : 30.974,
        "S" : 32.06,
        "Cl" : 35.45,
        "Ar" : 39.95,
        "K" : 39.098,
        "Ca" : 40.078,
        "Sc" : 44.956,
        "Ti" : 47.867,
        "V" : 50.942,
        "Cr" : 51.996,
        "Mn" : 54.938,
        "Fe" : 55.845,
        "Co" : 58.933,
        "Ni" : 58.693,
        "Cu" : 63.546,
        "Zn" : 65.38,
        "Ga" : 69.723,
        "Ge" : 72.63,
        "As" : 74.922,
        "Se" : 78.971,
        "Br" : 79.904,
        "Kr" : 83.798,
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
            let elementRange = match.range(at: 1)
            let element = (string as NSString).substring(with: elementRange)
            elementearray.append(element)
            let quantityRange = match.range(at: 3)
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
        rechnung = rechnung/molFromUser
        quantityarray = []
        return rechnung
    }

    
    var result: Double {
        get {
            return ergebnis
        }
    }
}
