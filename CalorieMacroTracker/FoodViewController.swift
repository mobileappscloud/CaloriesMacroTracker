//
//  FoodViewController.swift
//  CalorieMacroTracker
//
//  Created by Faisal Syed on 12/26/15.
//  Copyright © 2015 Faisal Syed. All rights reserved.
//

import UIKit
import CoreData

class FoodViewController: UIViewController {
    
    @IBOutlet var nameOfMeal: UITextField!
    
    @IBOutlet var numOfCalories: UITextField!
    
    @IBOutlet var numOfProtein: UITextField!
    
    @IBOutlet var numOfCarbs: UITextField!
    
    @IBOutlet var numOfFats: UITextField!
    
    var foodItems : [NSManagedObject] = []
    
    func saveFoodItem (name: String, numOfCalories: Int, numOfProtein: Int, numOfCarbs: Int, numOfFats: Int)
    {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = delegate.managedObjectContext
        
        //Get the Entity
        let foodItem = NSEntityDescription.insertNewObjectForEntityForName("Food", inManagedObjectContext: context)
        
        //Assign the proper values to each property within the entity
        foodItem.setValue(name, forKey: "name")
        foodItem.setValue(numOfCalories, forKey: "calories")
        foodItem.setValue(numOfProtein, forKey: "protein")
        foodItem.setValue(numOfFats, forKey: "fats")
        foodItem.setValue(numOfCarbs, forKey: "carbs")
        
        //Try Catch for an error
        var err: NSError?
        
        do
            {
                try context.save()
                self.foodItems.append(foodItem)
            }
        
            catch let err1 as NSError
            {
                err = err1
            }
        
            if (err != nil)
            {
                print("There was an issue with saving the data")
            }
        
            else
            {
                print("Successfully saved the food item")
            }
    }
    
    @IBAction func addFoodItem(sender: AnyObject)
    {
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}