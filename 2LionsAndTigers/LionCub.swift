//
//  LionCub.swift
//  2LionsAndTigers
//
//  Created by Karolis Kolbus on 26/03/2015.
//  Copyright (c) 2015 Karolis Kolbus. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly() {
        println("Lioncub: snuggle and be happy")
    }
    
    override func roar() {
        super.roar()
        println("Lioncub: growl growl")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
}