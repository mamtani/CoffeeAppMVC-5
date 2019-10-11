//
//  ViewController.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-20.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    let userController = UserController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchAllUsers()
    }
    
    @IBAction func onSignInClick(_ sender: UIButton){
//        self.showAlert(msg: "It works !")
        self.signIn()
        
    }
    
    @IBAction func doUpdateProfile(){
        userController.updateUser(user: User(fname: "JK", lname: "P", email: "jk@jk.ca", phone: "1234", gender: 1, bdate: Date(), street: "McLaghlin", city: "Brampton", postal: "L1K2L3", password: "gohome")!)
        
    }
    
    @IBAction func doDeleteAccount(){
        userController.deleteUser(email: "jk@jk.ca")
    }
    
    func showAlert(msg: String){
        let alertController = UIAlertController(title: "Alert Message", message:
            msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func signIn(){
        let username = txtUsername.text ?? "u"
        let password = txtPassword.text ?? "p"
        
//        if username == "test" && password == "test"
            if userController.validateUser(email: username, password: password)
        {

//            //open the order screen
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let orderVC = storyBoard.instantiateViewController(withIdentifier: "OrderScene") as! OrderVC
            navigationController?.pushViewController(orderVC, animated: true)
//            self.present(orderVC, animated: true, completion: nil)
        }else{
            self.showAlert(msg: "Incorrect username/password ! Try again.")
        }
    }
    
    @IBAction func doSignUp(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC = storyBoard.instantiateViewController(withIdentifier: "SignupScene") as! SignUpVC
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @IBAction func doForgotPassword(){
        
    }
    
    func fetchAllUsers(){
        var allUsers = (self.userController.getAllUsers() ?? nil)!
        
        if (allUsers != nil){
            for user in allUsers{
                print(user.value(forKey: "firstname") as! String, " ",
                      user.value(forKey: "email") as! String, " ",
                      user.value(forKey: "password") as! String)
            }
        }
    }
}

