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
  var myLions:[Lion] = []
  var myLionCubs:[LionCub] = []
  
  var currentIndex = 0
  var currentAnimal = (species: "Tiger", index: 0)
  
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
    
    var lion = Lion()
    lion.age = 4
    lion.isAlphaMale = true
    lion.image = UIImage(named: "Lion.jpg")
    lion.name = "Mufasa"
    lion.subSpecies = "West African"
    
    
    var lioness = Lion()
    lioness.age = 3
    lioness.isAlphaMale = false
    lioness.image = UIImage(named: "Lioness.jpeg")
    lioness.name = "Sarabi"
    lioness.subSpecies = "Barbary"
    
    var lionCub = LionCub()
    lionCub.age = 1
    lionCub.name = "Simba"
    lionCub.image = UIImage(named: "LionCub1.jpg")
    lionCub.subSpecies = "Masai"
    lionCub.isAlphaMale = true
    
    lion.roar()
    lioness.roar()
    lionCub.roar()
    lionCub.rubLionsCubBelly()
    
    var femaleLionCub = LionCub()
    femaleLionCub.age = 1
    femaleLionCub.name = "Nala"
    femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
    femaleLionCub.subSpecies = "Transvaal"
    femaleLionCub.isAlphaMale = false
    
    self.myLionCubs += [lionCub, femaleLionCub]
    self.myLions += [lion, lioness]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
    updateAnimal()
    updateView()
  }

  func updateAnimal() {
    switch currentAnimal {
    case ("Tiger", _):
      let randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
      currentAnimal = ("Lion", randomIndex)
    case ("Lion", _):
      let randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
      currentAnimal = ("LionCub", randomIndex)
    default:
      let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
      currentAnimal = ("Tiger", randomIndex)
    }
  }
  
  func updateView() {
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {

      if self.currentAnimal.species == "Tiger" {
        let tiger = self.myTigers[self.currentAnimal.index]
        self.myImageView.image = tiger.image
        self.breedLabel.text = tiger.breed
        self.ageLabel.text = "\(tiger.age)"
        self.nameLabel.text = tiger.name
        self.randomFactLabel.text = tiger.randomFact()
      }
      else if self.currentAnimal.species == "Lion" {
        let lion = self.myLions[self.currentAnimal.index]
        self.myImageView.image = lion.image
        self.breedLabel.text = lion.subSpecies
        self.ageLabel.text = "\(lion.age)"
        self.nameLabel.text = lion.name
        self.randomFactLabel.text = lion.randomFact()
      }
      else if self.currentAnimal.species == "LionCub" {
        let lionCub = self.myLionCubs[self.currentAnimal.index]
        self.myImageView.image = lionCub.image
        self.breedLabel.text = lionCub.subSpecies
        self.ageLabel.text = "\(lionCub.age)"
        self.nameLabel.text = lionCub.name
        self.randomFactLabel.text = lionCub.randomFact()
      }
      
      self.randomFactLabel.hidden = false
      
      }, completion: {
        (finished: Bool) -> () in
    })
  }
}

