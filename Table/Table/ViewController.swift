//
//  ViewController.swift
//  Table
//
//  Created by Bill on 2/10/16.
//  Copyright © 2016 BillCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    var repositories = [Repository]()
//    var repositories = [Scores]()
    var repositories = [Golfers]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
//        let url = "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc"
//        let url = "http://getgolfscores.com/getscores.php?id=418"
        let url = "http://getgolfscores.com/getgolfers.php?id=2"
        
        let reposURL = NSURL(string: url)

        if let JSONData = NSData(contentsOfURL: reposURL!) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(JSONData, options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                // use jsonData
                if let golfers = json["golfers"] as? [NSDictionary] {
                    for golfer in golfers {
                        repositories.append(Golfers(json: golfer))
                    }
                }
            } catch {
                // report error
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    // to activate the row click
    //  - had to implement UITableViewDelegate
    //  - set the view controller as the delegate for the tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        cell.textLabel?.text = repositories[indexPath.row].firstName! + " " + repositories[indexPath.row].lastName!
//        cell.detailTextLabel?.text = repositories[indexPath.row].lastName
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let golferID = repositories[indexPath.row].golferID
        let name = repositories[indexPath.row].firstName! + " " + repositories[indexPath.row].lastName!

        let alert = UIAlertController(title: name, message:"ID: \(golferID!)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        self.presentViewController(alert, animated: true){}
        
        /* score
        let score = repositories[indexPath.row].score
        let dateString = repositories[indexPath.row].date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let dateObj = dateFormatter.dateFromString(dateString!)
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let date = dateFormatter.stringFromDate(dateObj!)
        
        let alert = UIAlertController(title: "Detail", message:"Score: \(score!) \r\n Date: \(date)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        self.presentViewController(alert, animated: true){}
        */
    }
}

