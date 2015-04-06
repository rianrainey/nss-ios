//
//  CircularLayout.swift
//  Section09inClass
//
//  Created by Rian Rainey on 3/23/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

let NUM_PANELS = CGFloat(CGFloat(7.0))
let ITEM_SIZE = CGFloat(200.0)

class CircularLayout: UICollectionViewLayout {
  var center = CGPointMake(0, 0) 
  var radius = CGFloat(0.0)
  var cellCount = CGFloat(0.0)
  
  var deleteIndexPaths = [] as [NSIndexPath]
  var insertIndexPaths = [] as [NSIndexPath]
  
  override func prepareLayout() {
    super.prepareLayout()
    
    var cv = self.collectionView!
    var size = cv.frame.size
    cellCount = CGFloat(cv.numberOfItemsInSection(0))
    center = CGPointMake(size.width * NUM_PANELS/2.0, size.height / 2.0)
    radius = min(size.width, size.height) / 2.0
  }
  
  override func collectionViewContentSize() -> CGSize {
    let cv = self.collectionView!
    var retVal = CGSizeMake(cv.frame.size.width * NUM_PANELS, cv.frame.size.height)
    return retVal
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
    var cv = collectionView!
    var t = (cv.contentOffset.x - cv.frame.size.width) / (cv.frame.size.width) // fraction of screen scrolled
    var angle = t * CGFloat(M_PI)
    var attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE)
    var hArcLength = cosf((2.0 * Float(indexPath.item) * Float(M_PI) / Float(cellCount)) + Float(angle))
    var cx = cv.contentOffset.x + radius * CGFloat(hArcLength) + cv.frame.width/2.0
    var vArcLength = sinf((2.0 * Float(indexPath.item) * Float(M_PI) / Float(cellCount)) + Float(angle))
    var cy = cv.contentOffset.y + radius * CGFloat(vArcLength) + cv.frame.height/2.0
    attributes.center = CGPointMake(cx,cy)
    var zoom = t+1.3333333
    if zoom < 0.75 {
      zoom = 0.75
    }
    else if zoom > 1.25 {
      zoom = 1.25
    }
//    var scaleTransform = CATransform3DMakeScale(zoom, zoom, 1.0)
//    var rotateTransform = CATransform3DMakeRotation(-angle, 0.0, 1.0, 0.0)
//    var concatTransform = CATransform3DConcat(scaleTransform, rotateTransform)
//    attributes.transform3D = concatTransform
    attributes.zIndex = 1
    return attributes;
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    var cv = self.collectionView!
    var attributes = [] as [UICollectionViewLayoutAttributes]
    for var i=0; i < Int(self.cellCount); i++ {
      var indexPath = NSIndexPath(forItem: i, inSection: 0)
      attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath))
    }
    return attributes
  }
  
  override func prepareForCollectionViewUpdates(updateItems: [AnyObject]!) {
    super.prepareForCollectionViewUpdates(updateItems)
    for update in updateItems {
      if let u = update as? UICollectionViewUpdateItem {
        if u.updateAction == .Delete {
          if let bip = u.indexPathBeforeUpdate  {
            self.deleteIndexPaths.append(bip)
          }
        }
        else if u.updateAction == .Insert {
          if let aip = u.indexPathAfterUpdate {
            self.insertIndexPaths.append(aip)
          }
        }
      }
    }
  }
  
  override func finalizeCollectionViewUpdates() {
    self.deleteIndexPaths = [] as [NSIndexPath]
    self.insertIndexPaths = [] as [NSIndexPath]
  }
  
  override func initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    var attributes = super.initialLayoutAttributesForAppearingItemAtIndexPath(itemIndexPath)
    if contains(insertIndexPaths, itemIndexPath) {
      if attributes == nil {
        attributes = self.layoutAttributesForItemAtIndexPath(itemIndexPath)
      }
    }
    return attributes
  }
  
  override func finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    var cv = self.collectionView!
    var attributes = super.finalLayoutAttributesForDisappearingItemAtIndexPath(itemIndexPath)
    if contains(deleteIndexPaths, itemIndexPath) {
      if attributes == nil {
        attributes = self.layoutAttributesForItemAtIndexPath(itemIndexPath) as UICollectionViewLayoutAttributes
      }
      attributes!.alpha = 0.2
      var cx = cv.contentOffset.x + cv.frame.width/2.0
      var cy = cv.contentOffset.y + cv.frame.height/2.0
      attributes!.center = CGPointMake(cx, cy);
                  attributes!.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    }
    return attributes
  }
}
