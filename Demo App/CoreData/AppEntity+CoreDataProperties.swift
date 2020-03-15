//
//  AppEntity+CoreDataProperties.swift
//  
//
//  Created by Iñigo Flores Rabasa on 15/03/20.
//
//

import Foundation
import CoreData


extension AppEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppEntity> {
        return NSFetchRequest<AppEntity>(entityName: "AppEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var summary: String?
    @NSManaged public var rigths: String?
    @NSManaged public var releaseDate: String?

}
