//
//  GroupsCoordinator.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

protocol GroupsCoordinatorProtocol: class {
    func present(group: Group)
    func dismissGroup()
}

final class GroupsCoordinator: GroupsCoordinatorProtocol {
    
    weak var navigationController: UINavigationController?
    
    func present(group: Group) {
        
        // Preparing the new calçot
        let groupCoordinator = GroupCoordinator(navigationController: navigationController)
        let groupInteractor = GroupInteractor(group: group)
        let groupViewModel = GroupViewModel(interactor: groupInteractor, coordinator: groupCoordinator)
        let groupViewController = GroupViewController(viewModel: groupViewModel)
        
        // Adding observer listening to group members change
        groupInteractor.groupMembersDidChange.add { [weak groupViewController, weak groupInteractor] in
            guard let interactor = groupInteractor else { return }
            groupViewController?.viewModel = GroupViewModel(interactor: interactor, coordinator: groupCoordinator)
        }
        
        // Navigate to the new screen
        navigationController?.pushViewController(groupViewController, animated: true)
    }
    
    func dismissGroup() {
        navigationController?.popViewController(animated: true)
    }
}
