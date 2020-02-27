//
//  AppStep.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import RxFlow

enum AppStep: Step {
    case showMain
    case showDetail(data: String)
}
