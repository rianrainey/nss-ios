//
//  tiger.swift
//  LionsAndTigers
//
//  Created by Rian Rainey on 2/13/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
  var age = 0
  var name = ""
  var breed = ""
  var image = UIImage(named: "")
  
  func chuff() {
    println("Tiger: Chuff Chuff")
  }
  
  func chuffANumberOfTimes(numberOfTimes: Int) {
    for var chuff = 0; chuff < numberOfTimes; chuff++ {
      self.chuff()
    }
  }
  
  func chuffANumberOfTimes(numberOfTimes: Int, isLoud: Bool) {
    for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
      if isLoud {
        chuff()
      }
      else {
        println("Tiger: purr purr")
      }
    }
  }
  
  func ageInTigerYearsFromAge(regularAge: Int) -> Int {
    return regularAge * 3
  }
  
  func randomFact() -> String {
    let randomNumber = Int(arc4random_uniform(UInt32(3)))
    
    var randomFact:String
    
    if randomNumber == 0 {
      randomFact = "The tiger is the biggest species in the cat family"
    }
    else if randomNumber == 1 {
      randomFact = "Tigers can run at a rate of 3.3 meters/second"
    }
    else {
      randomFact = "A group of tigers is known as an ambush or streak"
    }
    
    return randomFact
  }
}



