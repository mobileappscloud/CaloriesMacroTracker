//
//  FoodViewController.swift
//  CalorieMacroTracker
//
//  Created by Faisal Syed on 12/26/15.
//  Copyright © 2015 Faisal Syed. All rights reserved.
//

import UIKit
import CoreData

class FoodViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameOfMeal: UITextField!
    
    @IBOutlet var numOfCalories: UITextField!
    
    @IBOutlet var numOfProtein: UITextField!
    
    @IBOutlet var numOfCarbs: UITextField!
    
    @IBOutlet var numOfFats: UITextField!
    
    var foodItems : [Food] = []
    
    func saveFoodItem (name: String, numOfCalories: Int, numOfProtein: Int, numOfCarbs: Int, numOfFats: Int)
    {
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = delegate.managedObjectContext
        
        //Get the Entity
        let foodItem = NSEntityDescription.insertNewObjectForEntityForName("Food", inManagedObjectContext: context) as! Food

        foodItem.setValue(name, forKey: "name")
        foodItem.setValue(numOfCalories, forKey: "calories")
        foodItem.setValue(numOfProtein, forKey: "protein")
        foodItem.setValue(numOfFats, forKey: "fats")
        foodItem.setValue(numOfCarbs, forKey: "carbs")
        
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
                let alert = UIAlertController(title: "Success", message: "Food saved", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                print("Successfully saved the food item")
            }
    }
    
    @IBAction func addFoodItem(sender: AnyObject)
    {
        var calorieNum = Int(numOfCalories.text!)
        if calorieNum == nil
        {
            calorieNum = 0
        }
        var proteinNum = Int(numOfProtein.text!)
        if proteinNum == nil
        {
            proteinNum = 0
        }
        var carbsNum = Int(numOfCarbs.text!)
        if carbsNum == nil
        {
            carbsNum = 0
        }
        var fatsNum = Int(numOfFats.text!)
        if fatsNum == nil
        {
            fatsNum = 0
        }
        
        //Save the textField entries
        if (validateTextFieldEntries(nameOfMeal.text!, calorieNumber: calorieNum!, proteinNumber: proteinNum!, carbsNumber: carbsNum!, fatsNumber: fatsNum!))
        {
            self.saveFoodItem(nameOfMeal.text!, numOfCalories: calorieNum!, numOfProtein: proteinNum!, numOfCarbs: carbsNum!, numOfFats: fatsNum!)
        
            NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil)
        }
        
        else
        {
            let alert = UIAlertController(title: "Oops!", message: "Enter all the data!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func validateTextFieldEntries(foodName:String, calorieNumber:Int, proteinNumber:Int, carbsNumber:Int, fatsNumber:Int) ->Bool
    {
        var returnValue: Bool
        returnValue = true
        
        if foodName.isEmpty
        {
            return false
        }
        
        if calorieNumber == 0
        {
            return false
        }
        
        if proteinNumber == 0
        {
            return false
        }
        
        if carbsNumber == 0
        {
            return false
        }
        
        if fatsNumber == 0
        {
            return false
        }
        
        return returnValue
    }

    @IBAction func clearEntries(sender: UIButton)
    {
        nameOfMeal.text! = ""
        numOfCalories.text! = ""
        numOfCarbs.text! = ""
        numOfFats.text! = ""
        numOfProtein.text! = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        nameOfMeal.resignFirstResponder()
        numOfCalories.resignFirstResponder()
        numOfCarbs.resignFirstResponder()
        numOfFats.resignFirstResponder()
        numOfProtein.resignFirstResponder()
        
        return true
    }
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameOfMeal.delegate = self
        numOfCalories.delegate = self
        numOfCarbs.delegate = self
        numOfFats.delegate = self
        numOfProtein.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
       view.endEditing(true)
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
    
    
    /*
    if let nameMeal = nameOfMeal.text, numCal = numOfCalories.text, numCarb = numOfCarbs.text, numFats = numOfFats.text, numProtein = numOfProtein.text where !nameMeal.isEmpty && numCal.isEmpty && numCarb.isEmpty && numFats.isEmpty && numProtein.isEmpty
    */

}
