//
//  Food+CoreDataProperties.swift
//  CalorieMacroTracker
//
//  Created by Faisal Syed on 12/31/15.
//  Copyright © 2015 Faisal Syed. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Food {

    @NSManaged var calories: NSNumber?
    @NSManaged var carbs: NSNumber?
    @NSManaged var fats: NSNumber?
    @NSManaged var protein: NSNumber?
    @NSManaged var name: String?

}
