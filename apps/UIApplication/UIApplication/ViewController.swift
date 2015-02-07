//
//  ViewController.swift
//  UIApplication
//
//  Created by Rian Rainey on 2/2/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var hexColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.randomizeColor()
        updateViewColor()
    }
    
    // Allow upside down orientation
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewColor() {
        let newColor = UIColor(
            red: CGFloat(self.sliderRed.value),
            green: CGFloat(self.sliderGreen.value),
            blue: CGFloat(self.sliderBlue.value),
            alpha: CGFloat(1.0))
        
        self.view.backgroundColor = newColor
        
        updateStatusBarForColor(newColor)
        updateHexLabel(newColor)
    }
    
    func updateHexLabel(newColor: UIColor) {
        var rgbColor = newColor
        let max = 15
        let radix = 16
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        rgbColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        let hexRed = String(Int(red * CGFloat(max)), radix: radix).uppercaseString
        let hexGreen = String(Int(green * CGFloat(max)), radix: radix).uppercaseString
        let hexBlue = String(Int(blue * CGFloat(max)), radix: radix).uppercaseString

        hexColorLabel.text = "Hex Color: \(hexRed+hexRed)\(hexGreen+hexGreen)\(hexBlue+hexBlue)"
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        updateViewColor()
    }

}

