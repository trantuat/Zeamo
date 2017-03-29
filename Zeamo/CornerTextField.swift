//
//  TextFeildCustom.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CornerTextField: UITextField {
    
    @IBInspectable var radius: CGFloat = 0{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var cornerTop: Bool = false{
        didSet{
            updateView()
        }
    }

    @IBInspectable var cornerBottom: Bool = false{
        didSet{
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        roundCorners(corners: [.allCorners], radius: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        roundCorners(corners: [.allCorners], radius: 0)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
   
    private func updateView(){
        if cornerTop {
            roundCorners(corners: [.topLeft, .topRight], radius: radius)
            return
        }
        if cornerBottom {
            roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
            return
        }
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
