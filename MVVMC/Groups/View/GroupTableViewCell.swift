//
//  GroupTableViewCell.swift
//  MVVMC
//
//  Created by Adam Studenic on 04/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "GroupCellIdentifier"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: GroupCellViewModel) {
        textLabel?.text = viewModel.groupName
        accessoryType = .disclosureIndicator
    }
}
