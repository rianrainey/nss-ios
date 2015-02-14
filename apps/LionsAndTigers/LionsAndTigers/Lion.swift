//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Rian Rainey on 2/14/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import Foundation
import UIKit

class Lion {
  var age = 0
  var isAlphaMale = false
  var image = UIImage(named: "")
  var name = ""
  var subSpecies = ""
  
  func roar() {
    println("ROOOAAAAR")
  }
  
  func changeToAlphaMale() {
    self.isAlphaMale = true
  }
  
  func randomFact() -> String {
    var randomFact:String
    if self.isAlphaMale {
      randomFact = "Male lions are easy to recongize"
    }
    else {
      randomFact = "Female lionesses form the stable social unit"
    }
    
    return randomFact
  }
}