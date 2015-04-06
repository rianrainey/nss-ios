//
//  CircleView.swift
//  CA
//
//  Created by Rian Rainey on 3/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  override func layoutSubviews() {
    layer.cornerRadius = bounds.width / 2.0
  }
  
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = cornerRadius
    }
  }
}
