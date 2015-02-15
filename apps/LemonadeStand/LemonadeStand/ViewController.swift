//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Rian Rainey on 2/15/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var moneyAmount: UILabel!
  @IBOutlet weak var startingLemonsAmount: UILabel!
  @IBOutlet weak var startingIceCubesAmount: UILabel!
  @IBOutlet weak var purchasedLemonsAmount: UILabel!
  @IBOutlet weak var purchasedIceCubesAmount: UILabel!
  @IBOutlet weak var lemonsMixAmount: UILabel!
  @IBOutlet weak var iceCubesMixAmount: UILabel!
  @IBOutlet weak var lemonPurchaseStepper: UIStepper!
  @IBOutlet weak var iceCubePurchaseStepper: UIStepper!
  @IBOutlet weak var lemonMixStepper: UIStepper!
  @IBOutlet weak var iceCubeMixStepper: UIStepper!
  
  var game = LemonadeGame()
  var playerMoneyAmount = 10.0
  var lemonAmount = 1
  var iceCubeAmount = 1
  
  var lemonPurchaseQty = 0
  var iceCubePurchaseQty = 0
  
  let priceOfLemon = 2.0
  let priceOfIceCube = 1.0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func lemonsPurchaseChanged(sender: UIStepper) {
    lemonPurchaseQty = Int(sender.value)
    purchasedLemonsAmount.text = "\(lemonPurchaseQty)"
  }

  @IBAction func iceCubesPurchaseChanged(sender: UIStepper) {
    iceCubePurchaseQty = Int(sender.value)
    purchasedIceCubesAmount.text = "\(iceCubePurchaseQty)"
  }
  
  @IBAction func lemonsMixChanged(sender: UIStepper) {
    lemonsMixAmount.text = "\(Int(sender.value))"
  }
  
  @IBAction func iceCubesMixChanged(sender: UIStepper) {
    iceCubesMixAmount.text = "\(Int(sender.value))"
  }
  
  @IBAction func startDayPressed(sender: UIButton) {
    if playerMoneyAmount > purchasePrice() {
      // Play the game
      purchaseSupplies(Int(lemonPurchaseQty), iceCubes: Int(iceCubePurchaseQty))
    }
    else {
      if lemonPurchaseQty == 0 && iceCubePurchaseQty == 0 {
        showAlertWithText(header: "Game Over", message: "You have no more money to play.")
      }
      else {
        showAlertWithText(header: "Not Enough Money", message: "Reduce your supply order")
      }
    }
  }
  
  func purchasePrice() -> Double {
    return (Double(lemonPurchaseQty) * priceOfLemon) + (Double(iceCubePurchaseQty) * priceOfIceCube)
  }
  
  func purchaseSupplies(lemons: Int, iceCubes: Int) {
    lemonAmount += lemons
    iceCubeAmount += iceCubes
    playerMoneyAmount -= purchasePrice()
    
    updatePlayerStats()
    resetSteppers()
  }
  
  func updatePlayerStats() {
    moneyAmount.text = dollarized(playerMoneyAmount)
    startingLemonsAmount.text = "\(lemonAmount)"
    startingIceCubesAmount.text = "\(iceCubeAmount)"
  }
  
  func resetSteppers() {
    lemonPurchaseStepper.value = 0
    purchasedLemonsAmount.text = "\(Int(lemonPurchaseStepper.value))"
    iceCubePurchaseStepper.value = 0
    purchasedIceCubesAmount.text = "\(Int(iceCubePurchaseStepper.value))"
    lemonMixStepper.value = 0
    lemonsMixAmount.text = "\(Int(lemonMixStepper.value))"
    iceCubeMixStepper.value = 0
    iceCubesMixAmount.text = "\(Int(iceCubeMixStepper.value))"
  }
  
  func showAlertWithText(header: String = "Warning", message: String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
  
  func dollarized(amount: Double) -> String {
    var formatter = NSNumberFormatter()
    formatter.numberStyle = .CurrencyStyle
    
    return formatter.stringFromNumber(amount)!
  }
}

