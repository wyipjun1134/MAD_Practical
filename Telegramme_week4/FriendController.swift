//
//  FriendController.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 26/11/20.
//

import Foundation
import UIKit
import CoreData

class FriendController{
    func AddFriend (friend:Friend)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        let contact = NSManagedObject(entity: entity, insertInto: context)
        
        contact.setValue(friend.Name, forKey: "name")
        contact.setValue(friend.profileImageName, forKey: "profileImageName")
        
        appDelegate.saveContext()
        
    }
    func AddMessageToFriend(friend:Friend, message:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        let contact = NSManagedObject(entity: entity, insertInto: context)
        
        contact.setValue(message.date, forKey: "date")
        contact.setValue(message.isSender, forKey: "isSender")
        contact.setValue(message.text, forKey: "text")
        contact.setValue(friend, forKey: "friend")
        
        appDelegate.saveContext()
        
    }
    func retriveMessageToFriend(friend:Friend)-> [Message]
    {
        var message:[NSManagedObject] = []
        var mList:[Message] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMessage")
        do{
            message = try context.fetch(fetchRequest)
            
            for m in message{
                if((m.value(forKey: "friend")) as! AnyHashable == friend as! AnyHashable)
                {
                 
                    let temp = Message.init(mdate: m.value(forKey: "date") as! Date,
                                            issender: m.value(forKey: "isSender") as! Bool,
                                            mtext: m.value(forKey: "text") as! String,
                                            mfriend: m.value(forKey: "friend") as! Friend)
                    mList.append(temp)
                }
                
               

            }
            
        }catch let error as NSError{
            print("Could not update contact. \(error), \(error.userInfo)")
        }
        
        return mList
    }
}
