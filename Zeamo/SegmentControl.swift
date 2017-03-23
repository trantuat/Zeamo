//
//  SegmentControl.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class SegmentControl: UIControl{
    
    //MARK: Property
    
    private var labels = [UILabel]()
    
    var delegate: SegmentControlDelegate? = nil
    
    var items: [String] = ["Upcoming","History","Passes"] {
        didSet{
            setUplabel()
        }
    }
    
    var textColor = UIColor.lightGray
    var textColorSelected = UIColor(red: 44/255, green: 68/225, blue: 120/225, alpha: 1)
    var borderWidth: CGFloat = 1
    var borderColor = UIColor.lightGray
    var font: UIFont = UIFont(name: "Avenir", size: 20.0)!
    var fontSelected: UIFont = UIFont(name: "Avenir-Heavy", size: 20.0)!
    var thumbView = UIView()
    
    var selectedIndex: Int = 0 {
        didSet{
            displayNewIndex()
        }
    }
    
    //MARK: Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //MARK: Private method
    
    private func setUpView(){
        layer.cornerRadius = 0
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        setUplabel()
        selectedIndex = 0
        insertSubview(thumbView, at: 0)
    }
    
    
    
    private func setUplabel(){
        
        for label in labels{
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1 ... items.count {
            let label = UILabel(frame: .zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            label.textColor = UIColor.gray
            label.font = font
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    private func displayNewIndex(){
        let label = labels[selectedIndex]
        thumbView.frame = label.frame
        label.textColor = textColorSelected
        label.font = fontSelected
    }
    
    //MARK: Override method
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds
        let newWidth = selectFrame.width / CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(items.count)
        
        for index in 0 ... labels.count - 1{
            let label = labels[index]
            label.layer.borderWidth = borderWidth / 2
            label.layer.borderColor = UIColor.lightGray.cgColor
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var newIndex: Int?
        
        for index in 0 ..< labels.count{
            labels[index].textColor = textColor
            labels[index].font = font
            if labels[index].frame.contains(location){
                newIndex = index
            }
        }
        
        if newIndex != nil{
            selectedIndex = newIndex!
            sendActions(for: .valueChanged)
            delegate?.didSelectItemAtIndex(index: newIndex!)
        }
        return false
    }
}

public protocol SegmentControlDelegate {
    func didSelectItemAtIndex(index: Int)
}
