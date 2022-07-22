//
//  StockEntity+CoreDataProperties.swift
//  project1
//
//  Created by Sena Nur Sari on 3/20/22.
//
//

import Foundation
import CoreData


extension StockEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StockEntity> {
        return NSFetchRequest<StockEntity>(entityName: "StockEntity")
    }

    @NSManaged public var ticker: String?
    @NSManaged public var price: Double
    @NSManaged public var count: Int32

}

extension StockEntity : Identifiable {

}
