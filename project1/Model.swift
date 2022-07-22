//
//  Model.swift
//  project1
//
//  Created by Sena Nur Sari on 3/20/22.
//

import Foundation
import CoreData


var items = [StockEntity]()

public class WalletModel{
    
    let context:NSManagedObjectContext?
    
    init(context: NSManagedObjectContext)
    {
        self.context = context
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StockEntity")
        items = ((try? context.fetch(fetchRequest)) as? [StockEntity])!
        
    }
 
    func buyStock(ticker: String) {

        let ent = NSEntityDescription.entity(forEntityName: "StockEntity", in: self.context!)
        let item = StockEntity(entity: ent!, insertInto:context!)
            item.ticker = ticker
            item.count = 1
           
        
        do {
            try context!.save()
        } catch {
            
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StockEntity")
        items = ((try? context!.fetch(fetchRequest)) as? [StockEntity])!
    }
    
    func sellStock(ticker: String) {
        
        for item in items {
            if (item.ticker==ticker) {
                if (item.count==1) {
                    context!.delete(item)
                    do {
                        try context!.save()
                    } catch {
                        
                    }
                    break
                }
                
            }
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StockEntity")
        items = ((try? context!.fetch(fetchRequest)) as? [StockEntity])!
    }
    
    
}

