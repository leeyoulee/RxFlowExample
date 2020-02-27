//
//  ViewController.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift
import RxFlow

class MainViewController: UIViewController, StoryboardBased, ViewModelBased  {
    
    @IBOutlet weak var userListTableView: UITableView!
    
    var viewModel: MainViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { return }
        
        userListTableView.register(UINib(nibName: UserListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserListTableViewCell.identifier)
        
        // 테이블뷰 바인딩
        self.viewModel.users.bind(to: self.userListTableView.rx.items(cellIdentifier: UserListTableViewCell.identifier, cellType: UserListTableViewCell.self)) { [weak self] _, element, cell in
            guard let _ = self else { return }
            cell.userNameLabel?.text = element.name
            cell.userPhoneNumLabel?.text = element.phone
        }.disposed(by: self.disposeBag)
        
        // 셀 클릭하면 상세화면으로 전환
        self.userListTableView.rx.modelSelected(User.self)
            .map{ $0.name }
            .subscribe(onNext: { [weak self] name in
                guard let `self` = self else { return }
                self.viewModel.pick(detail: name)
            }).disposed(by: disposeBag)
    }


}

