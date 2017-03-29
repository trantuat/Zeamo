//
//  ConfirmCreateAccountVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class ConfirmCreateAccountVC: UIViewController {
    
    @IBOutlet weak var passwordTextFeild: CornerTextField!
    
    @IBOutlet weak var emailTextFeild: CornerTextField!
    
    @IBOutlet weak var reenterPasswordTextFeild: CornerTextField!
    
    @IBOutlet weak var labelErrorHeigh: NSLayoutConstraint!
    
    var error = true

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func btnContinuteTap(_ sender: Any) {
        if error {
            labelErrorHeigh.constant = 40
            emailTextFeild.backgroundColor = UIColor(red: 247/255, green: 220/255, blue: 255/255, alpha: 1)
        }else{
            labelErrorHeigh.constant = 0
            emailTextFeild.backgroundColor = UIColor.clear
        }
        
        error = !error
        
    }


    

}
