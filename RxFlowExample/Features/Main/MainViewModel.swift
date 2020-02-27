//
//  MainViewModel.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift
import RxCocoa
import AuthenticationServices

class MainViewModel: Stepper, ServicesViewModel {
    let steps = PublishRelay<Step>()
    typealias Services = DataService
    var users = BehaviorRelay <[User]>(value: [])

    var services: Services! {
        didSet {
            self.users.accept(self.services.getUser())
        }
    }
    
    func pick (detail: String) {
        // 이부분이 실행되면, AppFlow의 showDetail를 타게되면서 화면이 전환됨
        self.steps.accept(AppStep.showDetail(data: detail))
    }
}
