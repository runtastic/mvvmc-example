//
//  GroupViewModel.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

final class GroupViewModel {
    
    private let interactor: GroupInteractorProtocol
    private let coordinator: GroupCoordinatorProtocol
    
    private var group: Group {
        return interactor.group
    }
    
    init(interactor: GroupInteractorProtocol, coordinator: GroupCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
    var groupName: String {
        return group.name
    }
}
