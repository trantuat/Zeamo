//
//  DeviderTextField.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/24/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit
import Material

@IBDesignable
class ArrowButtonTextField : TextField
{
    open fileprivate(set) var arrowButton: UIButton?
    
    fileprivate let leftImageLength: CGFloat = 22
    fileprivate let rightButtonLength: CGFloat = 15
    fileprivate let padding: CGFloat = 8
    
    var arrowDelegate: ArrowButtonTextFieldDelegate? = nil
    
    var arrowColor: UIColor = UIColor.lightGray {
        didSet{
            arrowButton?.tintColor = arrowColor
        }
    }
    
    
    @IBInspectable
    open var isArrowButtonEnabled: Bool = false  {
        didSet{
            updateView()
        }
    }
  
  
    override func leftViewRect( forBounds bounds: CGRect ) -> CGRect
    {
        let x = self.padding
        let y = ( bounds.size.height - self.leftImageLength ) / 2
        let leftBounds = CGRect( x: x, y: y, width: self.leftImageLength, height: self.leftImageLength )
        return leftBounds
    }
    
    override func rightViewRect( forBounds bounds: CGRect ) -> CGRect
    {
        let x = bounds.size.width - self.rightButtonLength - self.padding
        let y = ( bounds.size.height - self.rightButtonLength ) / 2
        let rightBounds = CGRect( x: x, y: y, width: self.rightButtonLength, height: self.rightButtonLength )
        return rightBounds
    }
    
    fileprivate func updateView()
    {
        if(isArrowButtonEnabled){
            arrowButton = UIButton(type: .system)
            arrowColor = UIColor.lightGray
            arrowButton?.setImage( UIImage( named: "arrow" ), for: .normal )
            arrowButton?.contentMode = .scaleAspectFit
            arrowButton?.addTarget( self, action: #selector( self.arrowClicked ), for: .touchUpInside )
            self.rightView = arrowButton
            self.clearButtonMode = .never
            self.rightViewMode = .always
        }
        
    }
    
    @objc fileprivate func arrowClicked( sender: UIButton )
    {
        self.endEditing(true)
        arrowButton?.tintColor = arrowColor
        arrowDelegate?.arrowButtonDidClick()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
}

protocol ArrowButtonTextFieldDelegate {
    func arrowButtonDidClick();
}

