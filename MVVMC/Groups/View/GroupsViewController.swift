//
//  GroupsViewController.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

final class GroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: GroupsViewModel {
        didSet {
            updateUI()
        }
    }
    
    private let tableView = UITableView(frame: .zero)
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: GroupTableViewCell.cellIdentifier)
        
        view.addSubview(tableView)
        
        title = viewModel.groupsCategory
    }
    
    private func layoutUI() {
        tableView.frame = view.frame
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
    
    // MARK: - UIViewController 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        layoutUI()
        viewModel.fetchGroups()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.cellIdentifier, for: indexPath) as? GroupTableViewCell else {
            fatalError("Could not dequeue cell with identifier: \(GroupTableViewCell.cellIdentifier)")
        }
        
        let groupCellViewModel = viewModel.data(forRowAt: indexPath.row)
        cell.configure(viewModel: groupCellViewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.showGroup(at: indexPath.row)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}
