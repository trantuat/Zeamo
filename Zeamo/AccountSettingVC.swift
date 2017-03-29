//
//  AccountSettingVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/27/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class AccountSettingVC: UITableViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = UIColor(red: 214/255, green: 218/255, blue: 225/255, alpha: 1)
        return v
    }

}

