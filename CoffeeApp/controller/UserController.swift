//
//  UserController.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class UserController{
    func insertUser(newUser: User){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity : NSEntityDescription? = NSEntityDescription.entity(forEntityName: "UserEntity", in: managedContext)
        
        //if we have access to user table
        if (userEntity != nil){
            let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
            
            user.setValue(newUser.firstname, forKey: "firstname")
            user.setValue(newUser.lastname, forKey: "lastname")
            user.setValue(newUser.email, forKey: "email")
            user.setValue(newUser.phone, forKey: "phone")
            user.setValue(newUser.streetAddress, forKey: "street")
            user.setValue(newUser.city, forKey: "city")
            user.setValue(newUser.postalCode, forKey: "postal_code")
            user.setValue(newUser.password, forKey: "password")
            user.setValue(newUser.birthdate, forKey: "birthdate")
            user.setValue(newUser.gender, forKey: "gender")
            
            do{
                //to perform insert operation on database table
                try managedContext.save()
                
            }catch let error as NSError{
                print("Insert user failed...\(error), \(error.userInfo)")
            }
        }
    }
    
    func updateUser(user : User){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", user.email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            
            let existingUser = result[0] as! NSManagedObject
            
            existingUser.setValue(user.firstname, forKey: "firstname")
            existingUser.setValue(user.lastname, forKey: "lastname")
            existingUser.setValue(user.phone, forKey: "phone")
            existingUser.setValue(user.streetAddress, forKey: "street")
            existingUser.setValue(user.city, forKey: "city")
            existingUser.setValue(user.postalCode, forKey: "postal_code")
            existingUser.setValue(user.gender, forKey: "gender")
            existingUser.setValue(user.birthdate, forKey: "birthdate")
            existingUser.setValue(user.password, forKey: "password")
            
            do{
                try managedContext.save()
                print("User update Successful")
            }catch{
                print("User update unsuccessful")
            }
        }catch{
            print("User update unsuccessful")
        }
        
    }
    
    func deleteUser(email: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            let existingUser = result[0] as! NSManagedObject
            
            managedContext.delete(existingUser)
            
            do{
                try managedContext.save()
                print("User delete Successful")
            }catch{
                print("User delete unsuccessful")
            }
            
        }catch{
            
        }
        
        
    }
    
    func validateUser(email: String, password: String) -> Bool{
        let allUsers = (self.getAllUsers() ?? nil)!
        
        if (allUsers != nil){
            for user in allUsers{
                let em = user.value(forKey: "email") as! String
                let pw = user.value(forKey: "password") as! String
                if (em == email && pw == password){
                    return true
                }
            }
        }
        return false
    }
    
    func getAllUsers() -> [NSManagedObject]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            return result as? [NSManagedObject]
        }catch{
            print("Data fetching Unsuccessful")
        }
        return nil
    }
}
