//
//  Tiger.swift
//  2LionsAndTigers
//
//  Created by Karolis Kolbus on 22/03/2015.
//  Copyright (c) 2015 Karolis Kolbus. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff () {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffNumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
        self.chuff()
        }
    }

    func chuffNumberOfTimes (numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                self.chuff()
            } else {
                println("Tiger: purr purr")
            }
        }
    }
    func ageInTigerYearsFromAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        var randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        let randomFact: String
        
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        } else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        } else {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        
        return randomFact
    }

}

