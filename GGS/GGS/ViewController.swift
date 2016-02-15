//
//  ViewController.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

import UIKit

// changed UIViewController to UITableViewController
class ViewController: UITableViewController {
    
//    let golfers = ["Bill", "Jeff", "Audrey"]
    var golfers = [Golfers]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        golfers.append(Golfers(GolferID: 1, FirstName: "Bill", LastName: "Arons"))
        golfers.append(Golfers(GolferID: 2, FirstName: "Joe", LastName: "Blow"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // added this 'tableView' delgate function
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golfers.count
    }

    // added this 'tableView' delgate function
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("golferCell")! as UITableViewCell
        
        // for one dimensional array
//        cell.textLabel?.text = golfers[indexPath.item]
        
        // for an array of complex objects
        cell.textLabel?.text = golfers[indexPath.item].FirstName
        
        return cell
    }
}

