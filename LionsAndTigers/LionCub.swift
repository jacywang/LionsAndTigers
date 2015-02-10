//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by JIAN WANG on 2/10/15.
//  Copyright (c) 2015 JACY WANG. All rights reserved.
//

import Foundation

class LionCup: Lion {
    func rubLionCubBelly() {
        println("LionCub: Snuggle and be happy!")
    }
    
    override func roar() {
        super.roar()
        println("LionCub: Growl Growl!")
    }
    
    override func randomFact() -> String {
        var randomFactString: String
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        } else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        
        return randomFactString
    }
}