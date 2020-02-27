//
//  DetailViewModel.swift
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

class DetailViewModel: Stepper, ServicesViewModel {
    let steps = PublishRelay<Step>()
    typealias Services = DataService
    var userData = BehaviorRelay <User?>(value: nil)

    var services: Services! {
        didSet {
            // init에서 초기화해준 name값으로 userData를 가져옴
            self.userData.accept(self.services.getUserData(name: userName))
        }
    }
    
    public let userName: String
    
    // AppFlow에서 초기화해줄때 이 부분이 불리면서, DetailViewModel내의 userName에 Main에서 던진 name값을 넣어줌
    init(withUserName name: String) {
        self.userName = name
    }
}
