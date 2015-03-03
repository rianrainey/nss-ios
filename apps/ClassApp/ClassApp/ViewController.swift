//
//  ViewController.swift
//  ClassApp
//
//  Created by Rian Rainey on 2/25/15.
//  Copyright (c) 2015 Centresource. All rights reserved.
//

import UIKit

let dataArray = [
    "foo",
    "bar",
    "blah",
    "roberto"
]

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refresh() {
        NSLog("how refreshing")
        self.refreshControl?.endRefreshing()
    }
}


extension ViewController: UITableViewDataSource {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as UITableViewCell
        cell.textLabel!.text = dataArray[indexPath.row]
        
        var photoCell = PhotoCell()
        var newCell = compositorNib.instantiateWithOwner(self, options: nil)
        photoCell.label!.text = "Row: \(indexPath.row)"
        photoCell.imageView = images[row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("secondSegue", sender: nil)
    }
}