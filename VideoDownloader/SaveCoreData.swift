//
//  SaveCoreData.swift
//  VideoDownloader
//
//  Created by FS K on 14.02.2023.
//

import Foundation
import UIKit
import CoreData

class SaveCoreData {
    
    func saveData() {
            
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appDelegate.persistentContainer.viewContext
        
        let videosArray = ["http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4",
                           "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_2mb.mp4",
                           "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_5mb.mp4",
                           "http://www.sample-videos.com/video/mp4/720/ big_buck_bunny_720p_10mb.mp4",
                           "http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4"]
        
        let imagesArray = ["https://www.cambridgema.gov/~/media/Images/sharedphotos/departmentphotos/animal.jpg?mw=1920",
                           "https://www.artfido.com/wp-content/uploads/2013/09/amazing-animal- pictures-37.jpg",
                           "https://www.artfido.com/wp-content/uploads/2013/09/amazing-animal- pictures-35.jpg",
                           "https://www.artfido.com/wp-content/uploads/2013/09/amazing-animal- pictures-32.jpg",
                           "https://www.artfido.com/wp-content/uploads/2013/09/amazing-animal- pictures-3.jpg"]
        
        assert(videosArray.count == imagesArray.count, "The number of items in the arrays must be equal")
        
        for i in 0..<videosArray.count {
            let videos = NSEntityDescription.insertNewObject(forEntityName: "Videos", into: context)
            videos.setValue(videosArray[i], forKey: "url")
            videos.setValue(imagesArray[i], forKey: "image")
      
            do {
                try context.save()
            } catch  {
                print("Could not save videos. \(error)")
            }
        }
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context )
    
        user.setValue("admin", forKey: "username")
        user.setValue(14562335, forKey: "password")
       
        do {
            try context.save()
        } catch  {
            print("Could not save user. \(error)")
        }
    }
    
    func fetchData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Videos")
        fetchRequest.returnsObjectsAsFaults = true
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let url = result.value(forKey: "url") as? URL {
                
                    }
                    if let imageData = result.value(forKey: "image") as? Data {
                        let image = UIImage(data: imageData)
                        //imageView.image = image
                
                    }
                }
            }
            
        } catch {
            print("error")
        }
        
    }
    
    func controlUser(username: String, password: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        if username == username{
                            
                            if let password = result.value(forKey: "password") as? Int {
                                
                                
                                
                            }
                            
                        }else {
                            
                        }
                        
                        
                    }
                }}
            
        } catch {
            print("error")
        }
    }
}
