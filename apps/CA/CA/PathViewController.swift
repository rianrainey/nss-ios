//
//  PathViewController.swift
//  CA
//
//  Created by Rian Rainey on 3/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class PathViewController: UIViewController {
  @IBOutlet weak var moonView: UIView!
  @IBOutlet weak var earthView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    let barButtonItem = UIBarButtonItem(title: "Start Animation", style: UIBarButtonItemStyle.Bordered, target: self, action: "startAnimation")
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func startAnimation() {
    let orbitAnimation = CAKeyframeAnimation()
    orbitAnimation.keyPath = "position"
    let rect = boundingRectForOrbitAnimation()
    orbitAnimation.path = UIBezierPath(ovalInRect: rect).CGPath
    orbitAnimation.duration = 4
    orbitAnimation.additive = true
    orbitAnimation.repeatCount = HUGE
    orbitAnimation.calculationMode = kCAAnimationPaced
    orbitAnimation.rotationMode = kCAAnimationRotateAuto // rotates the square too
    
    moonView.layer.addAnimation(orbitAnimation, forKey: "orbit")
  }
  
  func boundingRectForOrbitAnimation() -> CGRect {
    let sideLength = earthView.center.y - moonView.center.y
    return CGRectMake(-sideLength, 0, sideLength * 2.0, sideLength * 2.0)
  }
  
}
