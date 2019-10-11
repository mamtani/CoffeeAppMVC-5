//
//  SignUpVC.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-29.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var txtFirstname: UITextField!
    @IBOutlet var txtLastname: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPhone: UITextField!
    @IBOutlet var txtStreet: UITextField!
    @IBOutlet var txtCity: UITextField!
    @IBOutlet var txtPostalCode: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    @IBOutlet var segGender: UISegmentedControl!
    @IBOutlet var birthDate: UIDatePicker!
    
    let userController = UserController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sign Up"
        
        let doneButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action:   #selector(doSubmitClick))
        self.navigationItem.rightBarButtonItem = doneButton
        // Do any additional setup after loading the view.
        
        let calender = Calendar(identifier: .gregorian)
        var comps = DateComponents()
        comps.year = -100
        let minDate = calender.date(byAdding: comps, to: Date())
        let maxDate = Date()
        birthDate.maximumDate = maxDate
        birthDate.minimumDate = minDate
    }
    
    @objc private func doSubmitClick(){
       let fname = txtFirstname.text!
        let lname = txtLastname.text!
        let email = txtEmail.text!
        let phone = txtPhone.text!
        let street = txtStreet.text!
        let city = txtCity.text!
        let postal = txtPostalCode.text!
        let password = txtPassword.text!
        let confirmPassword = txtConfirmPassword.text!
        let birthdate = birthDate.date
        let gender = segGender.selectedSegmentIndex
        
        if (password == confirmPassword){
            let newUser = User(fname: fname, lname: lname, email: email, phone: phone, gender: gender, bdate: birthdate, street: street, city: city, postal: postal, password: password)
            
            if newUser != nil{
                userController.insertUser(newUser: newUser!)
                
                var allUsers = (self.userController.getAllUsers() ?? nil)!
                
                if (allUsers != nil){
                    for user in allUsers{
                        print(user.value(forKey: "firstname") as! String, " ",
                              user.value(forKey: "email") as! String, " ",
                              user.value(forKey: "password") as! String)
                    }
                }
                
                _ = navigationController?.popViewController(animated: true)
            }else{
                print("User creation unsuccessful")
            }
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
