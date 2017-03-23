//
//  Class.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation

class Class {
    
    var name: String!
    var time: String!
    var address: String!
    
    init(name: String) {
        self.name = name
    }
    
    init(time: String, name: String, address: String) {
        self.name = name
        self.time = time
        self.address = address
    }
}
