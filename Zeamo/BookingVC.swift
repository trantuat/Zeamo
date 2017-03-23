//
//  BookingVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit

class BookingVC: UIViewController{

    @IBOutlet weak var upComingVC: UIView!
    @IBOutlet weak var historyVC: UIView!
    @IBOutlet weak var passesVC: UIView!
    
    @IBOutlet weak var segment: SegmentControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segment.delegate = self
        switchVC(index: 0)
    }
    
    public func switchVC(index: Int){
        switch index {
            case 0:
                upComingVC.isHidden = false
                historyVC.isHidden = true
                passesVC.isHidden = true
                break;
            case 1:
                upComingVC.isHidden = true
                historyVC.isHidden = false
                passesVC.isHidden = true
                break;
            case 2:
                upComingVC.isHidden = true
                historyVC.isHidden = true
                passesVC.isHidden = false
                break;
            default:
                break;
        }
    }
}

extension BookingVC: SegmentControlDelegate{

    func didSelectItemAtIndex(index: Int) {
        self.switchVC(index: index)
    }
}
