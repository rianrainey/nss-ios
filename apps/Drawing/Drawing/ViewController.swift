//
//  ViewController.swift
//  Drawing
//
//  Created by Rian Rainey on 2/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeController: UIButton!
    var drawView: DrawView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.drawView = self.view as DrawView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func blueButtonPressed(sender: AnyObject) {
        self.drawView.strokeColor = UIColor.blueColor()
        println("blue")
    }
    
    
    @IBAction func orangeButtonPressed(sender: AnyObject) {
        self.drawView.strokeColor = UIColor.orangeColor()
        println("orange")
    }
}

