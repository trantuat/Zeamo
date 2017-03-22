//
//  DetailClassVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/21/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit
import MVVMAdditions
import RxSwift
import RxCocoa

class DetailClassVC: MVVMViewController {

    var viewModel: DetailClassViewModel!
    
    override var delegate: ViewModelDelegate? {
        return viewModel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingData()

    }

    private func bindingData() {

        let disposeBag = DisposeBag()
        
        viewModel.clazz
            .asDriver()
            .drive(onNext:{ [weak self]  value in
                guard let sSelf = self else { return }

                sSelf.title = value.name
            })
            .disposed(by: disposeBag)
        
        self.disposeBag = disposeBag
        
    }
    
}
