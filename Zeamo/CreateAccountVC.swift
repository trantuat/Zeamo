//
//  CreateAccountVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit
import MVVMAdditions

class CreateAccountVC: MVVMViewController {
    
    var viewModel: CreateAccountViewModel!
    
    override var delegate: ViewModelDelegate?{
        return viewModel
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.all
    }
    
}
