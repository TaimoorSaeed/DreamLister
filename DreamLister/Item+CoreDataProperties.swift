//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Nano Degree on 14/02/2017.
//  Copyright © 2017 Swift Pakistan. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var price: Double
    @NSManaged public var detail: String?
    @NSManaged public var title: String?
    @NSManaged public var toImage: NSSet?
    @NSManaged public var toStore: Store?
    @NSManaged public var toItemType: ItemType?

}

// MARK: Generated accessors for toImage
extension Item {

    @objc(addToImageObject:)
    @NSManaged public func addToToImage(_ value: Image)

    @objc(removeToImageObject:)
    @NSManaged public func removeFromToImage(_ value: Image)

    @objc(addToImage:)
    @NSManaged public func addToToImage(_ values: NSSet)

    @objc(removeToImage:)
    @NSManaged public func removeFromToImage(_ values: NSSet)

}
