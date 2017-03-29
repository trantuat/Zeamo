//
//  CornerView.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CornerView: UIView {
    
    @IBInspectable var mcornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = mcornerRadius
        }
    }
    
    @IBInspectable var mborderWidth:CGFloat = 0{
        didSet{
            self.layer.borderWidth = mborderWidth
        }
    }
    
    @IBInspectable var mborderColor:UIColor = .clear{
        didSet{
            self.layer.borderColor = mborderColor.cgColor
        }
    }

}
