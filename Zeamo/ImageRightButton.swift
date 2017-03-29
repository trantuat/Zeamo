//
//  ImageRightButton.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit

class ImageRightButton: RoundButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if let  textSize = titleLabel?.intrinsicContentSize,
            let imageSize = imageView?.intrinsicContentSize {
            
            self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: 0.0, right: imageSize.width);
            self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: textSize.width, bottom: 0.0, right: -textSize.width);
        }
    }
}
