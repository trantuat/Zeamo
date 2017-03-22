//
//  ViewController.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/20/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit
import MVVMAdditions
import RxCocoa
import RxSwift

class MainVC: MVVMViewController {
    
    var viewModel: MainViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override var delegate: ViewModelDelegate?{
        return viewModel
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = nil
        tableView.delegate = nil
        bindingData()
    }
    
    private func bindingData(){
        let disposeBag = DisposeBag()
        viewModel.classes
            .asDriver()
            .drive(tableView.rx.items(cellIdentifier: "ItemSearchCell", cellType: ItemSearchCell.self)){ [weak self] (row, element, cell) in
                guard let sSelf = self else { return }
                let clazz = sSelf.viewModel.classes.value[row]
                cell.name.text = clazz.name
                
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Class.self)
            .asDriver()
            .drive(onNext:{  [weak self] value in
                guard let sSelf = self else { return }
                sSelf.viewModel.gotoDetailClass(clazz: value)
                
            })
            .disposed(by: disposeBag)
        
        
        self.disposeBag = disposeBag
    }

    


}

