//
//  BaseViewController.swift
//  CA
//
//  Created by Rian Rainey on 3/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  @IBOutlet var animationView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

      // Do any additional setup after loading the view.
    let barButtonItem = UIBarButtonItem(title: "Start Animation", style: UIBarButtonItemStyle.Bordered, target: self, action: "startTimingAnimation")
    navigationItem.rightBarButtonItem = barButtonItem
  }
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func startFromToAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.x"
    let value = view.bounds.size.width - animationView.bounds.size.width
    animation.byValue = value
    animation.duration = 4
    
    animationView.layer.addAnimation(animation, forKey: "basic")
  }
  
  func startTimingAnimation() {
    let animation = CABasicAnimation()
    animation.keyPath = "position.y"
    let value = view.bounds.size.width - animationView.bounds.size.width
    animation.byValue = value
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    
    animationView.layer.addAnimation(animation, forKey: "basic")
  }
}
