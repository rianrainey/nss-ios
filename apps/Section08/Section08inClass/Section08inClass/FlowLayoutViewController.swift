//
//  FlowLayoutViewController.swift
//  Section08inClass
//
//  Created by Rian Rainey on 3/18/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

let reuseIdentifier = "CollectionViewCell"

class FlowLayoutViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let photos = [
    UIImage(named: "Library"),
    UIImage(named: "Memorial"),
    UIImage(named: "OnSpyPond"),
    UIImage(named: "SnowTunnel"),
    UIImage(named: "QuincyMarket")
  ]
  
  var selectedPhotos = [] as [NSIndexPath]
  var selectedPhoto:NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 3
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return photos.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell:CollectionViewCell
        if indexPath.section == ip.section && indexPath.row == ip.row {
          
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.image = photos[indexPath.row]
    
        // Configure the cell
    
        return cell
    }
  
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
      //1
      switch kind {
        //2
      case UICollectionElementKindSectionHeader:
        //3
        let headerView =
        collectionView.dequeueReusableSupplementaryViewOfKind(kind,
          withReuseIdentifier: "CollectionViewHeaderView",
          forIndexPath: indexPath)
          as! CollectionViewHeader
        headerView.headerLabel.text! = "Section: \(indexPath.section)"
        return headerView
      default:
        //4
        assert(false, "Unexpected element kind")
      }
    }

    // MARK: UICollectionViewDelegate
  
  override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    selectedPhoto = indexPath
    self.collectionView!.setNeedsDisplay()
  }
  
  override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
    selectedPhoto = nil
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    var retVal = CGSizeMake(300.0, 300.0)
    if let ip = selectedPhoto {
      if indexPath.section == ip.section && indexPath.row == ip.row {
        retVal = CGSizeMake(600.0, 600.0)
      }
    }
    return retVal
  }
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
