//
//  notes.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

/*
create new project

select main.storyboard (main view aka scene)
 - size to iphone 4.7
  - orientation to portrait
  - delete default view (will use table view instead)
  - editor / embed in / navigation controller (can size this too but don't need to - not displayed)
  - drag table view in

populate table view with static data
 - select table view and show connection inspector
 - drag datasource to table view
 - drag delegate to table view (to make use of some additional functionality?)
 - goto viewcontroller.swift
   - change UIViewController to UITableViewController (instead of appending each 'table view' delegates)
   - compile the project (so the 'table view' auto-completes display in xcode)
   - add array of items that will be used to populate table (e.g. golfers)
   - add the 'tableView' function (delegate) for 'numberOfRowsInSection' - type 'tableView' and use auto-complete
   - add the 'tableView' function (delegate) for 'cellForRowAtIndexPath' - type 'tableView' and use auto-complete
     - the name of the cell will be referenced here (e.g. golferCell)
 - goto the storyboard and select the table view
 - drag 'table view cell' in (prototype cells)
 - set the indentifier to the name of the cell referenced in 'cellForRowAtIndexPath' (e.g. golferCell)

should be able to run the project now with a populated table


add new view controller (for view that will display the scores)
 - resize like above
 - give it a title (ScoreView)

create segue F(aka transition) from main view to ScoreView
*/

