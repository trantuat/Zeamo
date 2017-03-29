//
//  UpcomingVC.swift
//  Zeamo
//
//  Created by Tran Tuat on 3/23/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import MVVMAdditions

class UpcomingVC: MVVMViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: UpcomingViewModel!
    
    override var delegate: ViewModelDelegate? {
        return viewModel
    }
       

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        
        viewModel.dataSource.configureCell = { (_, tv, indexPath, element) in
            let cell = tv.dequeueReusableCell(withIdentifier: "ItemBookCell") as! ItemBookCell
            cell.time.text = element.time
            cell.name.text = element.name
            cell.address.text = element.address
            return cell
        }
        
        viewModel.classes.asDriver()
            .drive(tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(Class.self)
            .asDriver()
            .drive(onNext:{  [weak self] value in
                guard let _ = self else { return }
                print(value.name)
            })
            .disposed(by: disposeBag)
        
        self.disposeBag = disposeBag
        
    }

}

extension UpcomingVC: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        v.backgroundView?.backgroundColor = UIColor(red: 226/255, green: 229/255, blue: 238/255, alpha: 1)
        v.textLabel?.textColor = UIColor.darkGray
        v.textLabel?.font = UIFont(name: "Avenir-Heavy", size: 19.0)!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}




//        tableView.rx
//            .itemSelected
//            .map { indexPath in
//                return (indexPath, self.viewModel.dataSource[indexPath])
//            }
//            .subscribe(onNext: { indexPath, model in
//                print(model.name)
//            })
//            .disposed(by: disposeBag)
