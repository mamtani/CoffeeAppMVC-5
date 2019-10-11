//
//  UserSingleton.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
class UserSingleton{
    static let sharedUserList = UserSingleton()
    
    private var userList : [User]
    
    private init(){
        userList = [User]()
    }
    
    public func insertUser(newUser: User){
        userList.append(newUser)
        print("User created successfully")
    }
    
    public func validateUser(email: String, password: String) -> Bool{
        for currentUser in userList{
            if (currentUser.email == email) && (currentUser.password == password){
                //user found
                return true
            }
//            else{
//                //no user account exists with given username/password
//                return false
//            }
        }
        return false
    }
    
    public func fetchAllUsers() -> [User]{
        return userList
    }
    
    public func fetchUserByID(email : String) -> User?{
        for currentUser in userList{
            if currentUser.email == email{
                return currentUser
            }
        }
        //no object found having same email
        return nil
    }
}
