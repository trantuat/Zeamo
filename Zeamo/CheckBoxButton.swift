//
//  CheckBoxButton.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/22/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CheckBoxButton: UIButton {
    
    @IBInspectable var mcornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = mcornerRadius
        }
    }
    @IBInspectable var mborderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = mborderWidth
        }
    }
    
    @IBInspectable var mborderColor: UIColor = .clear {
        didSet{
            self.layer.borderColor = mborderColor.cgColor
        }
    }
    
    @IBInspectable var checkedImage: UIImage = UIImage()
    
    @IBInspectable var unCheckedImage: UIImage = UIImage()
    
    @IBInspectable var borderColorChecked: UIColor = .clear
  
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.layer.borderColor = borderColorChecked.cgColor
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(unCheckedImage, for: .normal)
                self.layer.borderColor = mborderColor.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
}
