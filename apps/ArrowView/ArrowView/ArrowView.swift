//
//  ArrowView.swift
//  ArrowView
//
//  Created by Rian Rainey on 2/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

enum ArrowDirection: Int {
    case Up
    case Down
    case Left
    case Right
}

class ArrowView: UIView {
    var direction: ArrowDirection = .Up {
        didSet {
            switch direction {
            case .Up:
                transform = CGAffineTransformIdentity
            case .Down:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI))
            case .Right:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI_2))
            case .Left:
                transform = CGAffineTransformRotate(CGAffineTransformIdentity, CGFloat(M_PI_2 * 3.0))
            }
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.greenColor()
        self.clipsToBounds = true
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.direction = .Down
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("rotateArrow"))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func rotateArrow() {
        switch direction {
        case .Up:
            self.direction = .Right
        case .Down:
            self.direction = .Left
        case .Left:
            self.direction = .Up
        case .Right:
            self.direction = .Down
        }
    }
    
    override func drawRect(rect: CGRect) {
        let currentContext = UIGraphicsGetCurrentContext();
        
        let width = rect.size.width;
        let height = rect.size.height;
        
        let triangleCenterX = width / 2.0;
        let triangleLeftX = rect.origin.x;
        let triangleRightSideX = width;
        let triangleTopY = rect.origin.y;
        let triangleBottomY = height / 2.0;
        
        let baseLeftX = width / 4.0;
        let baseRightX = baseLeftX * 3.0;
        let baseTopY = triangleBottomY;
        let baseBottomY = height;
        
        var path = CGPathCreateMutable();
        CGPathMoveToPoint(path, nil, triangleCenterX, triangleTopY);
        CGPathAddLineToPoint(path, nil, triangleRightSideX, triangleBottomY);
        CGPathAddLineToPoint(path, nil, baseRightX, baseTopY);
        CGPathAddLineToPoint(path, nil, baseRightX, baseBottomY);
        CGPathAddLineToPoint(path, nil, baseLeftX, baseBottomY);
        CGPathAddLineToPoint(path, nil, baseLeftX, baseTopY);
        CGPathAddLineToPoint(path, nil, triangleLeftX, triangleBottomY);
        CGPathCloseSubpath(path);
        
        CGContextSetFillColorWithColor(currentContext, UIColor.blueColor().CGColor);
        
        CGContextAddPath(currentContext, path);
        CGContextDrawPath(currentContext, kCGPathFill);
    }
}
