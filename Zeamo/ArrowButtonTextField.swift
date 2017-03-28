//
//  DeviderTextField.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/24/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import Material

class ArrowButtonTextField: TextField {
    
    open fileprivate(set) var arrowButton: IconButton?
    
    
    @IBInspectable
    open var isArrowIconButtonEnabled: Bool {
        get {
            return nil != arrowButton
        }
        set(value) {
            
            guard nil == arrowButton else {
                return
            }
            isClearIconButtonEnabled = false
            isClearIconButtonAutoHandled = false
            arrowButton  = IconButton(image: #imageLiteral(resourceName: "arrow"), tintColor: placeholderNormalColor)
            
            arrowButton?.contentEdgeInsetsPreset = .none
            arrowButton?.pulseAnimation = .none
            rightView = arrowButton
            
            rightViewMode = .always
            rightView = arrowButton
            layoutSubviews()
        }
    }

}
