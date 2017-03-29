//
//  CardView.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/24/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
//    @IBInspectable var cornerRadius: CGFloat = 2
//    
      @IBInspectable var shadowOffsetWidth: Int = 0
      @IBInspectable var shadowOffsetHeight: Int = 3
//    @IBInspectable var shadowColor: UIColor? = UIColor.lightGray
//    @IBInspectable var shadowOpacity: Float = 0.8
//
// 
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    
}
