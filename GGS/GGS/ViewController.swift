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
    
    
//    let golfers = ["Bill", "Jeff", "Audrey"]    // load table with one dimensional array
    var golfers = [Golfer]()   // load table with an array of complex objects (manually or via json)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // populate array of complex objects manually
//        golfers.append(Golfers(GolferID: 1, FirstName: "Bill", LastName: "Arons"))
//        golfers.append(Golfers(GolferID: 2, FirstName: "Joe", LastName: "Blow"))
  
        // populate array of complex objects via json
        let url = "http://getgolfscores.com/getgolfers.php?id=2"
        let nsURL = NSURL(string: url)
        
        if let JSONData = NSData(contentsOfURL: nsURL!) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(JSONData, options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                // use jsonData
                if let data = json["golfers"] as? [NSDictionary] {
                    for golfer in data {
                        golfers.append(Golfer(json: golfer))
                    }
                }
            } catch {
                // report error
            }
        }
        
//        tableView.rowHeight = 70;
        tableView.backgroundView = UIImageView(image: UIImage(named: "honeycomb"))  // set tableView background to an image
        
    }
    
    // ----------------------------------------------------
    // added this function to update the navigation controller
    // ----------------------------------------------------
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ----------------------------------------------------
    // added this 'tableView' delegate function
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golfers.count
    }

    // ----------------------------------------------------
    // added this 'tableView' delegate function
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("golferCell")! as UITableViewCell
        
        // for one dimensional array
        //  cell.textLabel?.text = golfers[indexPath.item]
        
        // set cell backgrounds (with zebra effect)
        if (indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)            
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        // for an array of complex objects (loaded manually or via json)
        cell.textLabel?.text = golfers[indexPath.item].FirstName! + " " + golfers[indexPath.item].LastName!
        
        return cell
    }
    
    // ----------------------------------------------------
    // added this 'tableView' delegate function
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // use didSelectRowAtIndexPath to click a table row and update something on the currenct scene
        // use prepareForSegue to click a table row and transition to another scene
        
//        let golferID = golfers[indexPath.row].GolferID
//        let name = golfers[indexPath.row].FirstName! + " " + golfers[indexPath.row].LastName!
//        let alert = UIAlertController(title: name, message:"ID: \(golferID!)", preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
//        self.presentViewController(alert, animated: true){}
    }
    
    // ----------------------------------------------------
    // added this function to segue to ScoreViewController
    // ----------------------------------------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // sender is the object that initiated this action (UITableViewCell in this case)
        
        if (segue.identifier == "scoreView") {
            let scoreViewVC = segue.destinationViewController as! ScoreViewController
            let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)
            scoreViewVC.golfer = golfers[indexPath!.row]
        }        
    }
}

