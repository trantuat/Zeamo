//
//  MainViewModel.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import MVVMAdditions
import RxSwift

class MainViewModel: ViewModel{
    
    public let classes = Variable<[Class]>([])
    
    override init(navigator: Navigator?) {
        super.init(navigator: navigator)
        
    }
    
    override func onDidLoad() {
        genarateData()
    }
    
    private func genarateData(){
        classes.value.append(Class(name: "Gyms"))
        classes.value.append(Class(name: "Spinnings"))
        classes.value.append(Class(name: "Yoga"))
        classes.value.append(Class(name: "Crossfit"))
        classes.value.append(Class(name: "Swimming"))
        classes.value.append(Class(name: "Tennis"))
        classes.value.append(Class(name: "Martial Arts"))
        classes.value.append(Class(name: "Rock Climbing"))
    }
    
    public func gotoDetailClass(clazz: Class){
        navigator?.showView(key: .ShowDetailClass, data: clazz)
    }
}
