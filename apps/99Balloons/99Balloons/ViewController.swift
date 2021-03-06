//
//  ViewController.swift
//  99Balloons
//
//  Created by Rian Rainey on 2/14/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var balloonImageView: UIImageView!
  @IBOutlet weak var numberLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextButtonPressed(sender: AnyObject) {
    var balloon = Balloon()
    self.balloonImageView.image = balloon.randomImage()
    self.numberLabel.text = "\(balloon.randomNumber()) is the number of balloons"
    println(self.numberLabel.text)
  }

}

