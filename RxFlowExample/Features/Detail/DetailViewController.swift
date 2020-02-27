//
//  DetailViewController.swift
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

class DetailViewController: UIViewController, StoryboardBased, ViewModelBased  {
    
    var viewModel: DetailViewModel!

    @IBOutlet weak var phoneNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        
        guard let phoneNum = self.viewModel.userData.value?.phone else { return }
        self.phoneNumLabel?.text = phoneNum
    }

}
