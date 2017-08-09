//
//  RootCoordinator.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

final class RootCoordinator {
    
    static func presentGroups(groupsList: GroupsList = GroupsList(groups: [], groupsCategory: .joined)) -> UINavigationController {
        
        // Preparing the new calçot
        let groupsCoordinator = GroupsCoordinator()
        let groupsInteractor = GroupsInteractor(groupsList: groupsList, dataProvider: GroupDataProvider.shared)
        let groupsViewModel = GroupsViewModel(interactor: groupsInteractor, coordinator: groupsCoordinator)
        let groupsViewController = GroupsViewController(viewModel: groupsViewModel)
        
        // Adding observer listening to model change
        groupsInteractor.groupsListDidChange.add { [weak groupsViewController, weak groupsInteractor] in
            guard let interactor = groupsInteractor else {
                return
            }
            groupsViewController?.viewModel = GroupsViewModel(interactor: interactor, coordinator: groupsCoordinator)
        }
        
        let navigationController = UINavigationController(rootViewController: groupsViewController)
        groupsCoordinator.navigationController = navigationController
        
        return navigationController
    }
}
