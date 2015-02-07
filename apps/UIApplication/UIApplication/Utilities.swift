//
//  Utilities.swift
//  UIApplication
//
//  Created by Rian Rainey on 2/4/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit
import Foundation

func updateStatusBarForColor(backgroundColor: UIColor){
    let backgroundColor = backgroundColor
    var grayscale: CGFloat = 0.0
    backgroundColor.getWhite(&grayscale, alpha: nil)
    let statusBarStyle: UIStatusBarStyle = grayscale > 0.5 ? .Default : .LightContent
    UIApplication.sharedApplication().setStatusBarStyle(statusBarStyle, animated: false)
}