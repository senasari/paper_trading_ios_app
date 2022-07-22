//
//  ImageEntity+CoreDataProperties.swift
//  project1
//
//  Created by Sena Nur Sari on 4/23/22.
//
//

import Foundation
import CoreData


extension ImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageEntity> {
        return NSFetchRequest<ImageEntity>(entityName: "ImageEntity")
    }

    @NSManaged public var picture: Data?

}

extension ImageEntity : Identifiable {

}
