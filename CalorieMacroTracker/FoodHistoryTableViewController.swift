//
//  FoodHistoryTableViewController.swift
//  CalorieMacroTracker
//
//  Created by Faisal Syed on 12/26/15.
//  Copyright © 2015 Faisal Syed. All rights reserved.
//

import UIKit
import CoreData

class FoodHistoryTableViewController: UITableViewController {

    @IBOutlet var myTableVew: UITableView!
    
    var foods : [Food] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Basic TableView setup
        title = "Food Items"
        myTableVew.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Grab the Entity
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = delegate.managedObjectContext
        let request = NSFetchRequest(entityName: "Food")
        
        var err: NSError?
        
        do
            {
                foods = try context.executeFetchRequest(request) as! [Food]
            }
        
            catch let err1 as NSError
            {
                err = err1;
            }
        
            if(err != nil)
            {
                print("Problem with loading the data")
            }
        
            else
            {
                print("Successfully loaded the data")
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
       return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return foods.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cellIdentifier = "Cell"
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        
        let foodName = foods[indexPath.row].name
        let foodProtein = foods[indexPath.row].protein
        let foodCarbs = foods[indexPath.row].carbs
        let foodFats = foods[indexPath.row].fats
        let foodCalories = foods[indexPath.row].calories
        
        //Update the cell
        cell.textLabel?.text = foodName
        cell.detailTextLabel?.text = "\(foodCalories!) calories \(foodCarbs!)g carbs \(foodFats!)g fats \(foodProtein!)g protein"
        //cell.detailTextLabel?.text = "test label 123"
        return cell
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
