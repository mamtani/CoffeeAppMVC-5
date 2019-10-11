//
//  ReceiptVC.swift
//  CoffeeApp
//
//  Created by Jigisha Patel on 2019-09-22.
//  Copyright © 2019 JK. All rights reserved.
//

import UIKit

class ReceiptVC: UIViewController {

    var billAmount : Double! = 0.0
    @IBOutlet var lblBillAmount : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblBillAmount.text = "$ " + String(self.billAmount)
    }
    

    @IBAction func onOkayClick(){
        
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
