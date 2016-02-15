//
//  TableController.swift
//  Test
//
//  Created by Bill on 2/8/16.
//  Copyright © 2016 BillCode. All rights reserved.
//

import UIKit
import Foundation

class TableController: UITableViewController {

//    var TableData:Array<String> = Array <String>()
    var TableData:NSArray = []
//    var TableData = [String: String]()
    var TempData:Array<String> = Array <String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CallWebService()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TableData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        
        let item = self.TableData[indexPath.row] as! [String : String]

        cell.textLabel?.text = item["country"]
        
        return cell
    }

    /*
    func CallWebService_OLD()
    {
        let UrlApi = "http://www.kaleidosblog.com/tutorial/tutorial.json"
        let Url = NSURL(string: UrlApi)
        let Session = NSURLSession.sharedSession()
        let Work = Session.dataTaskWithURL(Url!, completionHandler: { dataTask, response, error -> Void in
            if (error != nil)
            {
                print(error)
            }
            var datos:NSData = NSData(data: dataTask!)
            print(datos)
            print(response)
            self.ParseDataToJson(datos)
        })
        
        Work.resume()
    }

    func CallWebService()
    {
        let URL = NSURL(string: "http://www.kaleidosblog.com/tutorial/tutorial.json")
        
        let downloadTask = NSURLSession.sharedSession().dataTaskWithURL(URL!) {(data, response, error) -> Void in
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                print (webContent)
            }
        }
        downloadTask.resume()
    }
    */
    
    func CallWebService()
    {
        let postEndpoint: String = "http://jsonplaceholder.typicode.com/posts/1"
        guard let url = NSURL(string: postEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = NSURLRequest(URL: url)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
            (data, response, error) in
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard error == nil else {
                print("error calling GET on /posts/1")
                print(error)
                return
            }
            // parse the result as JSON, since that's what the API provides
            let post: NSDictionary
            do {
                post = try NSJSONSerialization.JSONObjectWithData(responseData,
                    options: []) as! NSDictionary
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
            // now we have the post, let's just print it to prove we can access it
            print("The post is: " + post.description)
            
            // the post object is a dictionary
            // so we just access the title using the "title" key
            // so check for a title and print it if we have one
            if let postTitle = post["title"] as? String {
                print("The title is: " + postTitle)
            }
            
            for (id, data) in post {
                let a = id
                let b = data
                
                if (a as! String == "title") {
                    self.TempData.append(b as! String)
                    
//                    self.TableData.addObject(b)
                }
            }
            
            self.TableData = self.TempData as NSArray
            self.tableView.reloadData()
            
            
        })
        
        task.resume()
        
    }
    
    
    func ParseDataToJson(datos:NSData)
    {
        do {
            let JsonWithDatos:AnyObject! = try NSJSONSerialization.JSONObjectWithData(datos, options: NSJSONReadingOptions.MutableContainers)
            
            print(JsonWithDatos)
            
            TableData = JsonWithDatos as! NSMutableArray
            print(TableData)
            print(TableData.count)
            //test
            //let cell: AnyObject = self.TableData[55]
            //print(cell)
            self.tableView.reloadData()
            
        } catch {
            print(error)
        }
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
