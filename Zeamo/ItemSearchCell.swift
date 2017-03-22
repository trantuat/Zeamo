//
//  ItemSearchCell.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class ItemSearchCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }

}
