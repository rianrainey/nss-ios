//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Rian Rainey on 2/14/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import Foundation

class LionCub: Lion {
  func rubLionsCubBelly() {
    println("LionCub: Smile and be happy")
  }
  
  override func roar() {
    super.roar()
    println("LionCub: growl growl")
  }
  
  override func randomFact() -> String {
    var randomFactString = ""
    
    if isAlphaMale {
      randomFactString = "Cubs are usually hidden in bushes"
    }
    else {
      randomFactString = "Cubs being eating meat at the age of 6 weeks"
    }
    
    return randomFactString
  }
}