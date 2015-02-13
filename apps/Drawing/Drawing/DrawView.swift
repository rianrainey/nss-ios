//
//  DrawView.swift
//  Drawing
//
//  Created by Rian Rainey on 2/11/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class DrawView: UIView {

    private var allPoints = [UITouch: [CGPoint]]()
    private var colors = [UITouch : UIColor]()
    
    var strokeColor: UIColor = UIColor.blackColor()
    
    override func awakeFromNib() {
        self.multipleTouchEnabled = true
    }

    override func drawRect(rect: CGRect) {
        // Drawing code
        let currentContext = UIGraphicsGetCurrentContext()
        for (touch, points) in allPoints {
            self.drawPoints(points, color: self.colors[touch]!, context: currentContext)
        }
    }
    
    func drawPoints(points: [CGPoint], color: UIColor, context: CGContextRef) {
        if points.count > 1 {
            let path = CGPathCreateMutable()
            let firstPoint = points[0]
            CGPathMoveToPoint(path, nil, firstPoint.x, firstPoint.y)
        
            for pointIndex in 1..<points.count {
                let point = points[pointIndex]
                CGPathAddLineToPoint(path, nil, point.x, point.y)
            }
            
            let strokeColor = color
            CGContextSetStrokeColorWithColor(context, strokeColor.CGColor)
            CGContextSetLineWidth(context, 25.0)
            CGContextAddPath(context, path)
            CGContextDrawPath(context, kCGPathStroke)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            allPoints[touch as UITouch] = [CGPoint]()
            colors[touch as UITouch] = self.strokeColor
            processTouch(touch as UITouch)
        }
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            processTouch(touch as UITouch)
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        for touch in touches {
            processTouch(touch as UITouch)
        }
    }
    
    func processTouch(touch: UITouch) {
        let point = touch.locationInView(self)
        allPoints[touch]?.append(point)
        setNeedsDisplay()
    }
    
    

}
