//
//  AppStepper.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

class AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        return AppStep.showMain // 처음 스텝을 메인으로 설정 -> AppFlow의 showMain으로 이동
    }
}
