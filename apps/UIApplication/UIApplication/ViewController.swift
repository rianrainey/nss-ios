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
    }

    @IBAction func sliderChanged(sender: UISlider) {
        updateViewColor()
    }

}

