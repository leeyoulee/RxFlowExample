//
//  AppFlow.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import Foundation
import UIKit
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {
    
    var root: Presentable {
        return navigationController
    }
    
    private lazy var navigationController: UINavigationController = {
        let navigation = UINavigationController()
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }()
    
    private let services: DataService! // 앱 내에서 데이터를 받아와서 뿌려줄? 부분을 선언함
    
    init(services: DataService) { // SceenDelegate에서 앱이 실행되면서 초기화해주는 부분임
        self.services = services
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .showMain:
            let mainViewModel = MainViewModel() // showMain 스텝을 타면서, viewModel을 초기화해줌
            let mainViewController = MainViewController.instantiate(withViewModel: mainViewModel,
                                                                    andServices: self.services) // 뷰컨에 viewModel값을 넣어줌
            
            mainViewController.title = "main"
            self.navigationController.pushViewController(mainViewController, animated: false)
            
            return .one(flowContributor: .contribute(withNextPresentable: mainViewController,
                                                     withNextStepper: mainViewModel))

        case .showDetail(let data):
            let detailViewModel = DetailViewModel(withUserName: data) // viewModel에 showDetail스텝을 타면서 넣어준 데이터를 담아 초기화해줌 (MainViewController에서 셀 클릭했을때 이 스텝을 탐)
            let detailViewController = DetailViewController.instantiate(withViewModel: detailViewModel,
                                                                    andServices: self.services)
            
            detailViewController.title = "detail"
            self.navigationController.pushViewController(detailViewController, animated: false)
            
            return .one(flowContributor: .contribute(withNextPresentable: detailViewController,
                                                     withNextStepper: detailViewModel))
        }
    }
}



