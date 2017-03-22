//
//  LoginVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit
import MVVMAdditions

class LoginVC: MVVMViewController {
    
    var viewModel: LoginViewModel!
    
    override var delegate: ViewModelDelegate?{
        return viewModel
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



}
