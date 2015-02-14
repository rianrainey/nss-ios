//
//  Balloon.swift
//  99Balloons
//
//  Created by Rian Rainey on 2/14/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import Foundation
import UIKit

public struct Balloon {
  var image = UIImage(named: "")
  var number: Int = 0
  static let RANDOM_IMAGE_MAX = 3 // That's how many images we have
  static let RANDOM_NUM_MAX: Int = 100
  
  func randomNumber() -> Int {
    return generateRandomNumber(Balloon.RANDOM_NUM_MAX)
  }
  
  func randomImage() -> UIImage {
    let randomInteger = generateRandomNumber(Balloon.RANDOM_IMAGE_MAX)
    return UIImage(named: "RedBalloon\(randomInteger).jpg")!
  }
  
  private func generateRandomNumber(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max))) + 1
  }
}