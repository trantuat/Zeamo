//
//  DetailClassViewModel.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/21/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import MVVMAdditions
import RxSwift
import RxCocoa

class DetailClassViewModel: ViewModel{
    
    public var clazz: Variable<Class>!
    
    override init(navigator: Navigator?) {
        super.init(navigator: navigator)
    }
    
    override func onDidReceive(data: Any?) {
        if let cls = data as? Class {
            clazz = Variable<Class>(cls)
        }
    }
}


