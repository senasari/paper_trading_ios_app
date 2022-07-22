//
//  ImageModel.swift
//  project1
//
//  Created by Sena Nur Sari on 4/23/22.
//

import Foundation
import CoreData
import UIKit


var imageItem = [UIImage]()


public class ImageModel {
    
    let context:NSManagedObjectContext?
    
    init(context: NSManagedObjectContext)
    {
        self.context = context
        loadImage()
        
    }
    
    func saveImage(myPNGData: Data) {
        let ent = NSEntityDescription.entity(forEntityName: "ImageEntity", in: self.context!)
        
        let newItem = ImageEntity(context: self.context!)
   

        
        newItem.picture = myPNGData
        
        do {
            try self.context?.save()
        } catch {
        }
        
        loadImage()
    }
    
    func loadImage() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEntity")
        var fetchResults = ((try? context!.fetch(fetchRequest)) as? [ImageEntity])!
        imageItem = [UIImage(data: fetchResults[fetchResults.count-1].picture! as Data)!]
        
    }
    
    
    
}
