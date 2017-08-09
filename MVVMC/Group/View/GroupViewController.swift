//
//  GroupViewController.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

final class GroupViewController: UIViewController {
    
    private let nameLabel = UILabel(frame: .zero)
    
    var viewModel: GroupViewModel {
        didSet {
            self.updateUI()
        }
    }
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutUI()
        styleUI()
        updateUI()
    }
    
    private func setupUI() {
        view.addSubview(nameLabel)
    }
    
    private func layoutUI() {
        nameLabel.frame = view.frame
    }
    
    private func styleUI() {
        view.backgroundColor = .white
        nameLabel.textAlignment = .center
    }
    
    private func updateUI() {
        title = viewModel.groupName
        nameLabel.text = viewModel.groupName
    }
}
