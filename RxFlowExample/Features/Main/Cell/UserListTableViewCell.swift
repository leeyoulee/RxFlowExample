//
//  UserListTableViewCell.swift
//  RxFlowExample
//
//  Created by 이유리 on 27/02/2020.
//  Copyright © 2020 이유리. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    static let identifier = String(describing: UserListTableViewCell.self)
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userPhoneNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
}
