//
//  ViewController.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

import UIKit

// changed UIViewController to UITableViewController
class ViewController: UITableViewController, UISearchResultsUpdating {
    var menu: MainMenu?   // set in prepareForSegue (MainViewController.swift)
    
//    let golfers = ["Bill", "Jeff", "Audrey"]    // load table with one dimensional array
    var golfers = [Golfer]()   // load table with an array of complex objects (manually or via json)
    var filteredGolfers = [Golfer]()
    
    // search bar added via code (not via ui)
    let searchController = UISearchController(searchResultsController: nil)
   
    // ----------------------------------------------------
    // viewDidLoad
    // ----------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        let leagueID = menu?.LeagueID
        self.title = (menu!.OptionName)
        
        // populate array of complex objects manually
//        golfers.append(Golfers(GolferID: 1, FirstName: "Bill", LastName: "Arons"))
//        golfers.append(Golfers(GolferID: 2, FirstName: "Joe", LastName: "Blow"))
  
        // populate array of complex objects via json
        let url = "http://getgolfscores.com/api/getgolfers.php?id=\(leagueID!)"
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
        tableView.backgroundView = UIImageView(image: UIImage(named: "background2"))  // set tableView background to an image
//        tableView.backgroundColor = UIColor.purpleColor() // can set this via UI / attributes
//        tableView.separatorStyle = .None // remove line between table rows
        
        // search bar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search by First Name"
        
        // had to add this to resolve error message
        // attempting to load the view of a view controller while it is deallocating… UISearchController
        searchController.view.removeFromSuperview()
    }
    
    // ----------------------------------------------------
    // viewDidAppear
    // ----------------------------------------------------
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        navigationController?.navigationBar.alpha = 0.5   // transparent navigation bar
    }

    // ----------------------------------------------------
    // didReceiveMemoryWarning
    // ----------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ----------------------------------------------------
    // numberOfRowsInSection - tableView
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredGolfers.count
        } else {
            return golfers.count
        }
    }

    // ----------------------------------------------------
    // cellForRowAtIndexPath - tableView
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("golferCell")! as UITableViewCell
        let golfer: Golfer
        
        if searchController.active && searchController.searchBar.text != "" {
            golfer = filteredGolfers[indexPath.row]
        } else {
            golfer = golfers[indexPath.row]
        }
        
        // for one dimensional array
        //  cell.textLabel?.text = golfers[indexPath.item]
        
        // set cell backgrounds (with zebra effect)
        if (indexPath.item % 2 == 0) {
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)            
        }
  
        // can change the 'selected' cell background
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.whiteColor()
//        cell.selectedBackgroundView = bgColorView
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.adjustsFontSizeToFitWidth = true;
        
        // remove white space before separator line (also need to update at a tableview level - see notes.swift) -- method 1
//        cell.separatorInset = UIEdgeInsetsMake(0, 0, cell.frame.size.width, 0)
//        if (cell.respondsToSelector("preservesSuperviewLayoutMargins")){
//            cell.layoutMargins = UIEdgeInsetsZero
//            cell.preservesSuperviewLayoutMargins = false
//        }
        // end method 1
        
        // remove white space before separator line (also need to update at a tableview level - see notes.swift) - method 2
        // remove seperator inset
//        if cell.respondsToSelector("setSeparatorInset:") {
//            cell.separatorInset = UIEdgeInsetsZero
//        }
        // prevent the cell from inheriting the Table View's margin settings
//        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
//            cell.preservesSuperviewLayoutMargins = false
//        }
        // explictly set your cell's layout margins
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        // end method 2
        
        let lastName = String(golfer.LastName!.characters.first!) + "."
        
        // for an array of complex objects (loaded manually or via json)
//        cell.textLabel?.text =  golfers[indexPath.item].FirstName! + " " + golfers[indexPath.item].LastName!
        cell.textLabel?.text =  golfer.FirstName! + " " + lastName  // creating golfer object above now
        
        return cell
    }
    
    // ----------------------------------------------------
    // didSelectRowAtIndexPath
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
    // prepareForSegue
    // ----------------------------------------------------
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // sender is the object that initiated this action (UITableViewCell in this case)
        
        if segue.identifier == "golferView" {
            let golfer: Golfer
            let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell)
            let controller = segue.destinationViewController as! GolferViewController
            
            if searchController.active && searchController.searchBar.text != "" {
                golfer = filteredGolfers[indexPath!.row]
            } else {
                golfer = golfers[indexPath!.row]
            }
            
            controller.golfer = golfer
        }
    }

    // ----------------------------------------------------
    // updateSearchResultsForSearchController - UISearchResultsUpdating
    // ----------------------------------------------------
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    // ----------------------------------------------------
    // helper function for search bar
    // ----------------------------------------------------
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredGolfers = golfers.filter { golfer in
            return golfer.FirstName!.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
}

