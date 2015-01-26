//
//  ViewController.swift
//  HelloWorld
//
//  Created by Rian Rainey on 1/19/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloWorldLabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.helloWorldLabel!.textColor = UIColor.redColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleColor(sender:UIButton) {
        if self.helloWorldLabel?.textColor == UIColor.blackColor() {
            self.helloWorldLabel?.textColor = UIColor.redColor()
        } else {
            self.helloWorldLabel?.textColor = UIColor.blackColor()
        }
    }
}

