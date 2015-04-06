//
//  ViewController.swift
//  Section09inClass
//
//  Created by Rian Rainey on 3/23/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit
 
let photos = [
  UIImage(named: "Library"),
  UIImage(named: "SnowTunnel"),
  UIImage(named: "OnSpyPond"),
  UIImage(named: "QuincyMarket"),
  UIImage(named: "Sept11Memorial")
]

class ViewController: UICollectionViewController, UICollectionViewDataSource {
  @IBOutlet var circularLayout: CircularLayout!
  @IBOutlet weak var ellipticalOutlet: EllipticalLayout!
  var cellCount:Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let cv = self.collectionView!
    var offset = CGPointMake(floor(NUM_PANELS/2.0) * cv.frame.width, 0.0)
    cv.contentOffset = offset
    cellCount = photos.count * 2
    
    var tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
    self.collectionView!.addGestureRecognizer(tapRecognizer)
    
    var pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "handlePinch:")
    self.collectionView!.addGestureRecognizer(pinchRecognizer)
  }
  
  @IBAction func handleTap(sender:UITapGestureRecognizer) {
    let cv = self.collectionView!
    
    if sender.state == UIGestureRecognizerState.Ended {
      var tapPoint = sender.locationInView(cv)
      if let tappedCellPath = cv.indexPathForItemAtPoint(tapPoint) {
        var indexPaths = [tappedCellPath]
        self.cellCount = self.cellCount - 1
        cv.performBatchUpdates({ () -> Void in
          cv.deleteItemsAtIndexPaths(indexPaths)
          },
          completion: { (success) -> Void in
            NSLog("Received completion \(success) of batch updates")
        })
      }
      else {
        self.cellCount = self.cellCount + 1
        cv.performBatchUpdates({ () -> Void in
          var indexPath = NSIndexPath(forItem: 0, inSection: 0)
          cv.insertItemsAtIndexPaths([indexPath])
          },
          completion: { (success) -> Void in
            NSLog("Received completion \(success) of batch updates")
        })
      }
      NSLog("fnished handling")
    } 
  }
  
  @IBAction func handlePinch(sender:UIPinchGestureRecognizer) {
//    var layout: UICollectionViewLayout = self.circularLayout!
//    if sender.scale < 1.0 {
//      layout = self.ellipticalOutlet!
//    }
    let cv = self.collectionView!
    var layout: UICollectionViewLayout = cv.collectionViewLayout
    
    if sender.state == UIGestureRecognizerState.Ended {
      var scale = sender.scale
      if scale < 0.9 {
        layout = self.ellipticalOutlet!
      }
      else if scale > 1.1 {
        layout = self.circularLayout!
      }
      if layout != cv.collectionViewLayout {
        UIView.animateWithDuration(10.0, animations: { () -> Void in
          cv.performBatchUpdates({ () -> Void in
            cv.setCollectionViewLayout(layout, animated: true)
            }, completion: { (success) -> Void in
              
          })
          
          }, completion: { (success) -> Void in
            
        }) 
      }
    }
    
//    let cv = self.collectionView!
//    UIView.animateWithDuration(2.0, animations: { () -> Void in
//      cv.performBatchUpdates({ () -> Void in
//        cv.setCollectionViewLayout(layout, animated: true)
//        }, completion: { (success) -> Void in
//          
//      })
//      
//      }, completion: { (success) -> Void in
//        
//    })
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellCount
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    var cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageViewCell
    cell.imageView.image = photos[indexPath.row % photos.count]
    
    return cell
  }
}

