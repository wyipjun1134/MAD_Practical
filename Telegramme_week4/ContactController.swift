//
//  ContactController.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 26/11/20.
//

import Foundation
import UIKit
import CoreData

class ContactController{
    func AddContact (newContact: Contact)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        let contact = NSManagedObject(entity: entity, insertInto: context)
        
        contact.setValue(newContact.firstName, forKey: "firstname")
        contact.setValue(newContact.lastName, forKey: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        appDelegate.saveContext()
        
    }
   
    func RetrieveAllContact()->[Contact]
    {
        var contact:[NSManagedObject] = []
        var con: [Contact] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                 let temp = Contact.init(firstname: c.value(forKey: "firstname") as! String,
                                       lastname:  c.value(forKey: "lastname") as! String,
                                       mobileno:  c.value(forKey: "mobileno") as! String)
                con.append(temp)
                
            }
            
        }catch let error as NSError{
            print("Could not retrieve all contact. \(error), \(error.userInfo)")
        }
        return con
        
    }
    func updateContact(mobilemo:String, newContact:Contact)
    {
        var contact:[NSManagedObject] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contact = try context.fetch(fetchRequest)
            
            for c in contact{
                if((c.value(forKey: "mobileno") as! String) == mobilemo)
                {
                    c.setValue(newContact.firstName, forKey: "firstname")
                    c.setValue(newContact.lastName, forKey: "lastname")
                    c.setValue(newContact.mobileNo, forKey: "mobileno")
                    
                    appDelegate.saveContext()
                
                }
                
               
            }
            
        }catch let error as NSError{
            print("Could not update contact. \(error), \(error.userInfo)")
        }
   
    }
    func deleteContact(mobilemo:String)
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDContact")
        
        fetchRequest.predicate = NSPredicate(format: "mobileno = %@", mobilemo)
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }

    }
    
   
  
}
