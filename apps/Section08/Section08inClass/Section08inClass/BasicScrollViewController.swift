//
//  BasicScrollViewController.swift
//  Section08inClass
//
//  Created by Rian Rainey on 3/16/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class BasicScrollViewController: UIViewController, UIScrollViewDelegate {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var vSlider: UISlider!
  @IBOutlet weak var hSlider: UISlider!

  var imageView: UIImageView!
  
  let image = UIImage(named: "Library.png")!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var doubleTapRecognizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
    doubleTapRecognizer.numberOfTapsRequired = 2
    doubleTapRecognizer.numberOfTouchesRequired = 1
    scrollView.addGestureRecognizer(doubleTapRecognizer)
    
    imageView = UIImageView(image: image)
  }
  
  override func viewWillAppear(animated: Bool) {
    NSLog("WillAppear ScrollView frame = \(scrollView.frame), bounds = \(scrollView.bounds), content = \(scrollView.contentSize)")
  }
  
  override func viewDidAppear(animated: Bool) {
    NSLog("DidAppear ScrollView frame = \(scrollView.frame), bounds = \(scrollView.bounds), content = \(scrollView.contentSize)")
    
    // 1
    NSLog("Load ScrollView frame = \(scrollView.frame), bounds = \(scrollView.bounds), content = \(scrollView.contentSize)")
    var imageSize = CGSizeMake(image.size.width, image.size.height)
    imageView.frame = CGRect(origin: CGPointMake(0.0, 0.0), size:imageSize)
    
    // 2
    scrollView.addSubview(imageView)
    scrollView.contentSize = imageSize
    
    // 3
    let scrollViewFrame = scrollView.frame
    let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
    let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
    let minScale = min(scaleWidth, scaleHeight);
    scrollView.minimumZoomScale = minScale;
    
    // 4
    scrollView.maximumZoomScale = 1.0
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = minScale
    
    
    // 5
    centerScrollViewContents()
    
    self.view.setNeedsDisplay()
  }
  
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    NSLog("DidRotate ScrollView frame = \(scrollView.frame), bounds = \(scrollView.bounds), content = \(scrollView.contentSize)")
    
    var imageSize = CGSizeMake(image.size.width, image.size.height)
    scrollView.contentSize = imageSize
    
    let scrollViewFrame = scrollView.frame
    let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
    let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
    let minScale = min(scaleWidth, scaleHeight);
    scrollView.minimumZoomScale = minScale;
    
    scrollView.maximumZoomScale = 1.0
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = minScale
    
    centerScrollViewContents()
  }
  
  override func viewDidLayoutSubviews() {
    NSLog("Layout ScrollView frame = \(scrollView.frame), bounds = \(scrollView.bounds), content = \(scrollView.contentSize)")
  }
  
  func centerScrollViewContents() {
    let boundsSize = scrollView.bounds.size
    var contentsFrame = imageView.frame
    
    if contentsFrame.size.width < boundsSize.width {
      contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
    } else {
      contentsFrame.origin.x = 0.0
    }
    
    if contentsFrame.size.height < boundsSize.height {
      contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
    } else {
      contentsFrame.origin.y = 0.0
    }
    
    imageView.frame = contentsFrame
    
    hSlider.minimumValue = Float(scrollView.contentOffset.x - contentsFrame.size.width)
    hSlider.maximumValue = Float(scrollView.contentOffset.x + contentsFrame.size.width)
    hSlider.value = Float(scrollView.contentOffset.x)
    
    vSlider.minimumValue = Float(scrollView.contentOffset.y - contentsFrame.size.height)
    vSlider.maximumValue = Float(scrollView.contentOffset.y + contentsFrame.size.height)
    vSlider.value = Float(scrollView.contentOffset.y)
  }
  
  func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
    // 1
    let pointInView = recognizer.locationInView(imageView)
    
    // 2
    var newZoomScale = scrollView.zoomScale * 1.5
    newZoomScale = min(newZoomScale, scrollView.maximumZoomScale)
    
    // 3
    let scrollViewSize = scrollView.bounds.size
    let w = scrollViewSize.width / newZoomScale
    let h = scrollViewSize.height / newZoomScale
    let x = pointInView.x - (w / 2.0)
    let y = pointInView.y - (h / 2.0)
    
    let rectToZoomTo = CGRectMake(x, y, w, h);
    
    // 4
    scrollView.zoomToRect(rectToZoomTo, animated: true)
  }
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(scrollView: UIScrollView) {
    centerScrollViewContents()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func scrollHorizontally(sender:UISlider) {
    scrollView.contentOffset = CGPointMake(CGFloat(sender.value), scrollView.contentOffset.y)
  }
  
  @IBAction func scrollVertically(sender:UISlider) {
    scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, CGFloat(sender.value))
  }
  
}
