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
- editor / embed in / navigation controller (can size this too but don't need to - not displayed)

--------------------------------------------------------------------
add a table view and populate with one-dimensional array (hard-coded)
--------------------------------------------------------------------
- drag in a table view
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
- search background images via creativecommons.org

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
- can use makeappicon.com site to generate the images (or the app prepo)
- drag each image to the corresponding placeholder

--------------------------------------------------------------------
add new view controller (for view that will display the scores)
--------------------------------------------------------------------
- drag in a view controller (to an empty spot on the storyboard)
- resize it like default scene (above)
- give it a title (ScoreView) - optional
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

--------------------------------------------------------------------
add background image to profileView (easier because it's not a table view)
--------------------------------------------------------------------
- select profileView and drag in an 'image view'
- resize to the whole view including the navigation menu
- set the image property to background2

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

--------------------------------------------------------------------
create multiple segues from a tableview (each row in the table loads a different view)
--------------------------------------------------------------------
- select view controller (instead of table cell) -- use icon on the left at the top of the scene
- command-click and drag to the 1st scene and select 'show' (and give the segue an identifier)
- command-click and drag to the 2nd scene and select 'show' (and give the segue an identifier)
- add 'didSelectRowAtIndexPath' to view controller and implement 'performSegueWithIdentifier'
- see GolferViewController.swift

--------------------------------------------------------------------
search bar
--------------------------------------------------------------------
- can hook up search via UI and code... or code only
- for UI, drag in the 'search bar and search display controller' object
- ended up implementing via code only (see safari bookmarks for youtube and blog tutorial)

--------------------------------------------------------------------
hook up label with dynamic text
--------------------------------------------------------------------
- drag label in the view
- select the label and open the assistant editor
- command-click and drag label to the view controller and give it a name (myLabel)
- IBOutlet - links object to the view controller

--------------------------------------------------------------------
submit app (see youtube video)
--------------------------------------------------------------------
- screenshots
 - 4s - 3.5
 - 5s - 4
 - 6  - 4.7
 - 6+ - 5.5
 - build app in each environment and save image from simulator (save at 100% scale)

- create a certificate - this might just be a one-time thing (same cert for all apps maybe)
 - keychain access / certificate assistant / request a cert from a cert authority
 - user name - email
 - common name - GGS Key
 - ca email - empty
 - save to disk (see swift / ggs folder)
 - uploaded the file during the app submission which generated a .cer file (see swift / ggs folder)
   - double-clicked that to add it to the keychain

- got a certificate error when validating the build
 - see 'missing ios distribution' bookmark (safari)

--------------------------------------------------------------------
remove white space before separator line in table view
--------------------------------------------------------------------
- select tableview / attributes / separator inset / custom / left / 0 -- fixes empty rows in tableview
- also need to update the cell -- fixes populated rows in tableview
 - see code in viewcontroller.swift / cellForRowAtIndexPath() -- two methods included

--------------------------------------------------------------------
UILabel - adjustsFontSizeToFitWidth
--------------------------------------------------------------------
- not working (like it did for the cells in the tableview)
- decided to word-wrap instead (via IB)
  - set lines to 2
  - increase label height (to display 2 lines)
  - set line breaks to 'word wrap'
- see profileView

--------------------------------------------------------------------
Scroll View
--------------------------------------------------------------------
- used for profileview
- see youtube for implementation and constraints
- setting constraints for each object on scroll view, dragged object to top of scroll view and used...
  - top space to container
  - center horizontally in container
- for the ViewLine objects, also had to drag object and use this (not sure why)...
  - bottom space to container
- to get the word-wrapping to work (see more info above), had to use these (via constraints 'pin' option)...
  - leading space to
  - trailing space to

--------------------------------------------------------------------
update root view controller
--------------------------------------------------------------------
- click storyboard / navigation scene
- delete root view controller
- select navigation controller and click-drag to the new view controller

--------------------------------------------------------------------
version update (for app store)
--------------------------------------------------------------------
- identity / version -- update
- identity / build -- update
- platorm / generic iOS device
- product / archive
- archives / validate
- archives / upload to app store
- itunes connect / my apps / + version
- enter version (same as above)
- select build (will get email when build is ready)
- submit for review

--------------------------------------------------------------------
misc
--------------------------------------------------------------------
- IB -- interface builder
- Editor / Arrange -- move object to front or back (select object on scene first) -- or just drag object via document outline
- naming convention -- roundsLabel
- copy object on view (label, etc) -- option - drag
- disconnect IBOutlet -- see swift bookmark
- simulator bug -- tableview separator not displayed when scaled to 50%

*/
