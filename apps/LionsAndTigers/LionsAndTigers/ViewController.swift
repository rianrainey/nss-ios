//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Rian Rainey on 2/13/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var breedLabel: UILabel!
  @IBOutlet weak var randomFactLabel: UILabel!
  
  var myTigers:[Tiger] = []
  var currentIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var myTiger = Tiger()
    myTiger.name = "Tigger"
    myTiger.breed = "Bengal"
    myTiger.age = myTiger.ageInTigerYearsFromAge(10)
    myTiger.image = UIImage(named: "BengalTiger.jpg")
    
    myImageView.image = myTiger.image
    nameLabel.text = myTiger.name
    ageLabel.text = "\(myTiger.age)"
    breedLabel.text = myTiger.breed
    randomFactLabel.text = myTiger.randomFact()
    
    var secondTiger = Tiger()
    secondTiger.name = "Bob"
    secondTiger.breed = "Lion"
    secondTiger.age = secondTiger.ageInTigerYearsFromAge(3)
    secondTiger.image = UIImage(named:"Lion.jpg")
    
    var thirdTiger = Tiger()
    thirdTiger.name = "Jacob"
    thirdTiger.breed = "Malayan Tiger"
    thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(4)
    thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
    
    var fourthTiger = Tiger()
    fourthTiger.name = "Spar"
    fourthTiger.breed = "Siberian Tiger"
    fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(5)
    fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
    
    myTigers += [myTiger, secondTiger, thirdTiger, fourthTiger]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
    var randomIndex:Int
    
    do {
      randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
    } while randomIndex == currentIndex
    
    currentIndex = randomIndex
    let currentTiger = myTigers[currentIndex]
    
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
        self.myImageView.image = currentTiger.image
        self.nameLabel.text = currentTiger.name
        self.ageLabel.text = "\(currentTiger.age)"
        self.breedLabel.text = currentTiger.breed
        self.randomFactLabel.text = currentTiger.randomFact()
        currentTiger.chuff()
      }, completion: {
        (finished: Bool) -> () in
      })
    }

}

