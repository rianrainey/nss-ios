//
//  ViewController.swift
//  Section08inClass
//
//  Created by Rian Rainey on 3/16/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! UITableViewCell
    
    cell.selectionStyle = .None
    cell.textLabel!.backgroundColor = UIColor.clearColor()
    let row = indexPath.row
    
    switch row {
    case 0: 
      cell.textLabel!.text = "Basic UIScrollView"
    case 1: 
      cell.textLabel!.text = "Custom UIScrollView"
    case 2: 
      cell.textLabel!.text = "Flow Layout"
    default:
      cell.textLabel!.text = "Unknown"
      cell.userInteractionEnabled = false
    }
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let row = indexPath.row
    switch row {
    case 0: 
      self.performSegueWithIdentifier("BasicScrollView", sender: tableView)
    case 1: 
      self.performSegueWithIdentifier("CustomScrollView", sender: tableView)
    case 2: 
      self.performSegueWithIdentifier("FlowLayout", sender: tableView)
    default:
      NSLog("Selected default cell")
    }
  }
}

