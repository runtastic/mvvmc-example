//
//  GroupsViewModel.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

final class GroupsViewModel {
    
    private let interactor: GroupsInteractorProtocol
    private let coordinator: GroupsCoordinatorProtocol
    
    private var groupsList: GroupsList {
        return interactor.groupsList
    }
    
    init(interactor: GroupsInteractorProtocol, coordinator: GroupsCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    var groupsCategory: String {
        return groupsList.groupsCategory.localizedString
    }
    
    func fetchGroups() {
        // interaction to be handled within calçot
        interactor.fetchGroups()
    }
    
    func dismissGroup() {
        // interaction leading to a different screen or calçot
        coordinator.dismissGroup()
    }
    
    func data(forRowAt index: Int) -> GroupCellViewModel {
        let group = groupsList.groups[index]
        return GroupCellViewModel(groupName: group.name)
    }
    
    func showGroup(at index: Int) {
        coordinator.present(group: groupsList.groups[index])
    }
    
    func numberOfRows() -> Int {
        return groupsList.groups.count
    }
}
