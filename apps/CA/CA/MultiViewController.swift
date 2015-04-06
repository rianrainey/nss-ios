//
//  MultiViewController.swift
//  CA
//
//  Created by Rian Rainey on 3/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class MultiViewController: UIViewController {
  @IBOutlet weak var password: UITextField!
  
  let shakeAnimation:CAKeyframeAnimation = {
    let animation = CAKeyframeAnimation()
    animation.keyPath = "position.x"
    animation.values = [0, 10, -10, 10, 0]
    animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
    animation.duration = 0.4
    
    animation.additive = true
    return animation
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

      // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    let barButtonItem = UIBarButtonItem(title: "Validate", style: UIBarButtonItemStyle.Bordered, target: self, action: "validatePassword")
    navigationItem.rightBarButtonItem = barButtonItem
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func startAnimation() {
    password.layer.addAnimation(shakeAnimation, forKey: "shake")
  }
  
  func validatePassword() {
    if password.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 6 {
      startAnimation()
    }
    else {
      let alert = UIAlertController(title: "Valid!", message: "soooo valid", preferredStyle: UIAlertControllerStyle.ActionSheet)
      let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
        println("\(action.title)")
      })
      let coolAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
        println("\(action.title)")
      })
      alert.addAction(alertAction)
      alert.addAction(coolAction)
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }
}
