//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Nano Degree on 14/02/2017.
//  Copyright © 2017 Swift Pakistan. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
}
