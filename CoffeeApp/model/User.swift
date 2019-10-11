//
//  User.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-30.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation
public class User{
    var firstname : String!
    var lastname : String!
    var email : String!
    var phone : String!
    var gender : Int!
    var birthdate : Date!
    var streetAddress : String!
    var city : String!
    var postalCode : String!
    var password : String!
    
    init?(fname: String, lname: String, email: String, phone: String, gender: Int, bdate: Date, street: String, city : String, postal : String, password: String){
        self.firstname = fname
        self.lastname = lname
        self.email = email
        self.phone = phone
        self.gender = gender
        self.birthdate = bdate
        self.streetAddress = street
        self.city = city
        self.postalCode = postal
        self.password = password
    }
    
}
