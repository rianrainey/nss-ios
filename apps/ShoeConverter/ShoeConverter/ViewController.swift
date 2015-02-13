//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Rian Rainey on 2/13/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mensShoeSizeTextField: UITextField!
    @IBOutlet weak var mensShoeSizeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func convertButtonPressed(sender: UIButton) {
        let sizeFromTextField = mensShoeSizeTextField.text.toInt()!
        let conversionConstant = 30
        
        mensShoeSizeLabel.hidden = false
        mensShoeSizeLabel.text = "\(sizeFromTextField + conversionConstant) in Euro Size"
        
    }
}

