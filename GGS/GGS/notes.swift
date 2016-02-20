//
//  notes.swift
//  GGS
//
//  Created by Bill on 2/14/16.
//  Copyright © 2016 Bill Arons. All rights reserved.
//

/*
--------------------------------------------------------------------
create a new project
--------------------------------------------------------------------

--------------------------------------------------------------------
select default scene on main.storyboard
--------------------------------------------------------------------
- size to iphone 4.7 (and orientation to portrait)
- delete default view (will use table view instead)
- drag in a table view
- editor / embed in / navigation controller (can size this too but don't need to - not displayed)

--------------------------------------------------------------------
add a table view and populate with one-dimensional array (hard-coded)
--------------------------------------------------------------------
- select table view and show connection inspector
 - drag datasource to table view
 - drag delegate to table view (to make use of some additional functionality?)
 - goto viewcontroller.swift
   - change UIViewController to UITableViewController (instead of appending the 'table view' delegates)
   - compile the project (so the 'table view' auto-completes display in xcode)
   - create an array of items that will be used to populate table (e.g. golfers)
   - add the 'tableView' function (delegate) for 'numberOfRowsInSection' - type 'tableView' and use auto-complete
   - add the 'tableView' function (delegate) for 'cellForRowAtIndexPath' - type 'tableView' and use auto-complete
     - the name of the cell will be referenced here (e.g. golferCell)
 - goto the scene, select the table view and drag in a 'table view cell' (prototype cells)
   - set the indentifier to the name of the cell referenced in 'cellForRowAtIndexPath' (e.g. golferCell)
 - should now be able to run the project and see the populated table

--------------------------------------------------------------------
populate table view with an array of complex objects (hard-coded)
--------------------------------------------------------------------
- create a model (complex type) in a swift file
- create an array of the complex type and load it via 'append'
- update logic in 'cellForRowAtIndexPath' to get data from the object

--------------------------------------------------------------------
populate table view with an array of complex objects (via json)
--------------------------------------------------------------------
- update the model to init via json
- add the logic to call the API and load the array (of complex objects) via the json

--------------------------------------------------------------------
add background image to table view
--------------------------------------------------------------------
- click on assets in the project navigator and drag in some images (pdf)
- set backgroundView to an image in viewDidLoad
- set 'cell' background in 'cellForRowAtIndexPath'
- see ViewController.swift

--------------------------------------------------------------------
activate selection of table row
--------------------------------------------------------------------
- add the 'tableView' function (delegate) for 'didSelectRowAtIndexPath'
- add logic to extract data from the object
- add an alert for testing
- this is used for clicking a table row to display an alert or update something on the current scene
- use 'prepareForSegue' to transition to another scene (e.g. golfer to scores)

--------------------------------------------------------------------
add 'add' button to the navigation menun - FINISH THIS LATER
--------------------------------------------------------------------
- drag a 'bar button item' in
- change 'system item' to Add (should change to a plus sign on the view)

--------------------------------------------------------------------
update look of navigation menu
--------------------------------------------------------------------
- add viewDidAppear method to view controller
- see ViewController.swift

--------------------------------------------------------------------
add an app icon
--------------------------------------------------------------------
- go to assets and click AppIcon
- go to inspector and select the environments (iPhone IOS 7 and later, etc)
- need several images (start with an 1024 x 1024 image)
- can use makeappicon.com site to generate the images
- drag each image to the corresponding placeholder

--------------------------------------------------------------------
add new view controller (for view that will display the scores)
--------------------------------------------------------------------
- drag in a view controller (to an empty spot on the storyboard)
- resize like above
- give it a title (ScoreView)

--------------------------------------------------------------------
add background image to scoreView (easier because it's not a table view)
--------------------------------------------------------------------
- select scoreView and drag in an 'image view'
- resize to the whole view including the navigation menu
- set the image property to honeycomb

--------------------------------------------------------------------
create view controller for ScoreView
--------------------------------------------------------------------
- file / new / file / cocoa touch class (make sure it's cocoa touch)
- class - ScoreViewController
- subclass - UIViewController
- save the file
- select ScoreView scene and set the class to ScoreViewController

--------------------------------------------------------------------
create segue (aka transition) from main view to ScoreView
--------------------------------------------------------------------
- select golferCell in the main view
- command-click and drag to the scoreView scene (or via document outline) and select 'show'
- should see segue link between main view and scoreView
- select the the segue and give it an identifier (e.g. scoreView)
- should now be able to run the project and click-thru from cell to scoreView

--------------------------------------------------------------------
hook up segue (aka transition) and pass data from main view to ScoreView
--------------------------------------------------------------------
- add function 'prepareForSegue' (see ViewController.swift)
- initialize the model variable in ScoreViewController.swift
- set the model variable in ViewController.swift
- use the model data in viewDidLoad (ScoreViewController.swift)

*/
