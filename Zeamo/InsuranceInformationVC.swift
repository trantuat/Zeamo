//
//  InsuranceInformationVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/24/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class InsuranceInformationVC: UIViewController {
    @IBOutlet weak var nameTextField: ArrowButtonTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    

}

extension InsuranceInformationVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let tf = textField as? ArrowButtonTextField{
            tf.arrowColor = UIColor.blue
        }
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let tf = textField as? ArrowButtonTextField{
            tf.arrowColor = UIColor.lightGray
        }
    }
}
