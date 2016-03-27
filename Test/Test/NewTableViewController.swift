
import UIKit

class NewViewController: UITableViewController {
    let golfer = ["Joe", "Jack", "Jimmy"]
    
    // ----------------------------------------------------
    // viewDidLoad
    // ----------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ----------------------------------------------------
    // numberOfRowsInSection - tableView
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return golfer.count
    }
    
    // ----------------------------------------------------
    // cellForRowAtIndexPath - tableView
    // ----------------------------------------------------
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        // for one dimensional array
        cell.textLabel?.text = golfer[indexPath.item]
        
        return cell
    }
}


/*
--------------------------------------------------------------------
add new view controller (for view that will display the scores)
--------------------------------------------------------------------
- delete default view (will use table view instead)
- drag in table view and hook it up (see default scene above)
- navigation section (at top of table view) will be activated when segue is created to this view)

--------------------------------------------------------------------
create view controller for ScoreView
--------------------------------------------------------------------
- file / new / file / cocoa touch class (make sure it's cocoa touch)
- class - ScoreViewController
- subclass - UITableViewController
- save the file
- select ScoreView scene and set the class to ScoreViewController
*/