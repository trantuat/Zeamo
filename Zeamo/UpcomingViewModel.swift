//
//  UpcomingViewModel.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import MVVMAdditions
import RxSwift
import RxCocoa
import RxDataSources

class UpcomingViewModel: ViewModel {
    
    public var classes = Variable<[SectionModel<String, Class>]> ([])
    
    public let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Class>>()

    override init(navigator: Navigator?) {
        super.init(navigator: navigator)
        
        initData()
    }
    
    func initData() {
        
        dataSource.titleForHeaderInSection = { dataSource, sectionIndex in
            return dataSource[sectionIndex].model
        }
        
        classes.value.append(contentsOf: [SectionModel(model: "First section", items: [
                            Class(time: "4:00-6:00pm",name : "Spinyoga1", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga2", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga3", address: "Revolution fitness")
                            ]),
                        SectionModel(model: "Second section", items: [
                            Class(time: "4:00-6:00pm",name : "Spinyoga4", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga5", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga6", address: "Revolution fitness")
                            ]),
                        SectionModel(model: "Third section", items: [
                            Class(time: "4:00-6:00pm",name : "Spinyoga7", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga8", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga9", address: "Revolution fitness")
                            ]),
                        SectionModel(model: "Fourth section", items: [
                            Class(time: "4:00-6:00pm",name : "Spinyoga10", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga11", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga12", address: "Revolution fitness")
                            ]),
                        SectionModel(model: "Fifth section", items: [
                            Class(time: "4:00-6:00pm",name : "Spinyoga13", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga14", address: "Revolution fitness"),
                            Class(time: "4:00-6:00pm",name : "Spinyoga15", address: "Revolution fitness")
                            ])
                        ])
    }
    
}
