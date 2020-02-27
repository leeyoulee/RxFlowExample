//
//  DataService.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import Foundation

class DataService {
    
    func getUser() -> [User] {
        return UserRepository.user
    }
    
    func getUserData(name: String) -> User {
        return UserRepository.user.filter{ $0.name == name }.first!
    }
    
}
