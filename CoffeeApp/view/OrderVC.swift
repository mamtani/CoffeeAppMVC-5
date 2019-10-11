//
//  OrderVC.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-20.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class OrderVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var coffeePicker : UIPickerView!
    @IBOutlet var txtCream : UITextField!
    @IBOutlet var txtSugar : UITextField!
    @IBOutlet var swtMapleSyrup : UISwitch!
    @IBOutlet var swtEspressoShot : UISwitch!
    @IBOutlet var swtWhippedCream : UISwitch!
    @IBOutlet var txtName : UITextField!
    
    var coffeeData : [String] = [String]()
    var coffeeAmount : [Double] = [Double]()
    var selectedCoffee : String! = "Unknown"
    
    var billAmount : Double! = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.populatePickers()
        
        txtSugar.text = "0"
        txtCream.text = "0"
        
        selectedCoffee = coffeeData[0]
        billAmount = coffeeAmount[0]
    }
    
    @IBAction func onDoneClick(){
        //gather order details
        var message = "Hi " + txtName.text!
        message += ", Please verify your order... "
        message += (selectedCoffee ?? coffeeData[0]) + " "
        message += (txtCream.text ?? "0") + " cream "
        message += (txtSugar.text ?? "0") + " sugar "
        
        if swtMapleSyrup.isOn{
            message += " Mapel Syrup"
            billAmount += 0.50
        }
        if swtEspressoShot.isOn{
            message += " Espresso Shot"
            billAmount += 0.70
        }
        if swtWhippedCream.isOn{
            message += " Whipped Cream"
            billAmount += 0.90
        }
        
        message += " Bill amount " + String(self.billAmount)
        showAlert(msg: message)
    }
    
    @IBAction func increaseCream(){
        var ncream = Int(txtCream.text!) ?? 0
        ncream += 1;
        
        txtCream.text = String(ncream)
    }
    
    @IBAction func decreaseCream(){
        var ncream = Int(txtCream.text!) ?? 0
        
        if ncream > 0{
            ncream -= 1;
        }
        
        txtCream.text = String(ncream)
    }
    
    @IBAction func increaseSugar(){
        var nsugar = Int(txtSugar.text!) ?? 0
        nsugar += 1;
        
        txtSugar.text = String(nsugar)
    }
    
    @IBAction func decreaseSugar(){
        var nsugar = Int(txtSugar.text!) ?? 0
        
        if nsugar > 0{
            nsugar -= 1;
        }
        
        txtSugar.text = String(nsugar)
    }
    
    func showAlert(msg: String){
        let alertMessage = UIAlertController(title: "Confirm your order", message: msg, preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertMessage.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.openReceiptScene()}))
        
        self.present(alertMessage, animated: true, completion: nil)
        
    }
    
    func populatePickers(){
        //initialize array data
        coffeeData = ["Dark Roast", "Original Blend", "French Vannilla", "Latte"]
        coffeeAmount = [1.20, 0.90, 1.25, 2.00]
        
        //connect data
        self.coffeePicker.delegate = self
        self.coffeePicker.dataSource = self
    }
    
    //number of columns in Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //number of rows in Pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.coffeeData.count
    }

    //assign data from array to picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.coffeeData[row]
    }
    
    //fetch selected item from coffee picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedCoffee = self.coffeeData[row]
        
        self.billAmount = self.coffeeAmount[row]
    }
    
    func openReceiptScene(){
        let sbMain : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let receiptVC = sbMain.instantiateViewController(withIdentifier: "ReceiptScene") as! ReceiptVC
        receiptVC.billAmount = self.billAmount
//        self.present(receiptVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(receiptVC, animated: true)
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
