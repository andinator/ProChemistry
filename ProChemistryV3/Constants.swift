//
//  Constants.swift
//  ProChemistryV3
//
//  Created by Andi Felder on 31.10.17.
//  Copyright © 2017 Andi Felder. All rights reserved.
//

import Foundation
import Lottie
import UIKit

struct constants {
    struct learningData {
        static let titel = ["Mol Einführung", "Geschichtlich", "Formel", "Anwendung", "Übungen"]
        static let untertitel = ["1", "2", "3", "4", "5,"]
        static let text = ["1.1", "2.1", "3.1", "4.1", "5.1"]
    }
    struct animations {
        static let checkedAnimation = LOTAnimationView(name: "checked_done")
        static let notificationAnimation = LOTAnimationView(name: "notification_request")
        static let toggleSwitchAnimation = LOTAnimationView(name: "toggle_switch")
    }
    struct onboarding {
        //Farben für OnboardingVC
        static let color1 = UIColor(red: 207/255, green: 103/255, blue: 118/255, alpha: 1.0)
        static let color2 = UIColor(red: 48/255, green: 65/255, blue: 93/255, alpha: 1.0)
        static let color3 = UIColor(red: 175/255, green: 193/255, blue: 250/255, alpha: 1.0)
        static let color4 = UIColor(red: 142/255, green: 171/255, blue: 222/255, alpha: 1.0)
        //Fonts
        static let titleFont = UIFont(name: "AvenirNext-Bold", size: 23.0)!
        static let descriptionFont = UIFont(name: "AvenirNext-Medium", size: 18.0)!
    }
    struct elemente {
        static let elementeKurzMitMol: Dictionary<String,Double> = [
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
    static let elmenteWikipedia = [
        "https://de.m.wikipedia.org/wiki/Wasserstoff",
        "https://de.wikipedia.org/wiki/Helium",
        "https://de.wikipedia.org/wiki/Lithium",
        "https://de.wikipedia.org/wiki/Beryllium",
        "https://de.wikipedia.org/wiki/Bor",
        "https://de.wikipedia.org/wiki/Kohlenstoff",
        "https://de.wikipedia.org/wiki/Stickstoff",
        "https://de.wikipedia.org/wiki/Sauerstoff",
        "https://de.wikipedia.org/wiki/Fluor",
        "https://de.wikipedia.org/wiki/Neon",
        "https://de.wikipedia.org/wiki/Natrium",
        "https://de.wikipedia.org/wiki/Magnesium",
        "https://de.wikipedia.org/wiki/Aluminium",
        "https://de.wikipedia.org/wiki/Silicium",
        "https://de.wikipedia.org/wiki/Phosphor",
        "https://de.wikipedia.org/wiki/Schwefel",
        "https://de.wikipedia.org/wiki/Chlor",
        "https://de.wikipedia.org/wiki/Argon",
        "https://de.wikipedia.org/wiki/Kalium",
        "https://de.wikipedia.org/wiki/Calcium",
        "https://de.wikipedia.org/wiki/Scandium",
        "https://de.wikipedia.org/wiki/Titan_(Element)",
        "https://de.wikipedia.org/wiki/Vanadium",
        "https://de.wikipedia.org/wiki/Chrom",
        "https://de.wikipedia.org/wiki/Mangan",
        "https://de.wikipedia.org/wiki/Eisen",
        "https://de.wikipedia.org/wiki/Cobalt",
        "https://de.wikipedia.org/wiki/Nickel",
        "https://de.wikipedia.org/wiki/Kupfer",
        "https://de.wikipedia.org/wiki/Zink",
        "https://de.wikipedia.org/wiki/Gallium",
        "https://de.wikipedia.org/wiki/Germanium",
        "https://de.wikipedia.org/wiki/Arsen",
        "https://de.wikipedia.org/wiki/Selen",
        "https://de.wikipedia.org/wiki/Brom",
        "https://de.wikipedia.org/wiki/Krypton"
        ]
    static let elementeNamenLang = [
        "Wasserstoff", "Helium", "Lithium", "Beryllium", "Bor", "Kohlenstoff", "Stickstoff", "Sauerstoff", "Fluor", "Neon", "Natrium", "Magnesium", "Aluminium", "Silicium", "Phosphor", "Schwefel", "Chlor", "Argon", "Kalium", "Calcium", "Scandium", "Titan", "Vanadium", "Chrom", "Mangan", "Eisen", "Cobalt", "Nickel", "Kupfer", "Zink", "Gallium", "Germanium", "Arsen", "Selen", "Brom", "Krypton"
        ]
    }
}
