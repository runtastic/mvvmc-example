//
//  GroupsInteractor.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

protocol GroupsInteractorProtocol {
    var groupsList: GroupsList { get }
    var groupsListDidChange: ObserverSet<Void> { get }
    
    func fetchGroups()
}

final class GroupsInteractor: GroupsInteractorProtocol {
    
    private(set) var groupsList: GroupsList {
        didSet {
            groupsListDidChange.notify()
        }
    }
    
    var groupsListDidChange = ObserverSet<Void>()
    
    private let dataProvider: GroupDataProvider
    
    init(groupsList: GroupsList, dataProvider: GroupDataProvider) {
        self.groupsList = groupsList
        self.dataProvider = dataProvider
    }
    
    func fetchGroups() {
        // fetch data from a data provider
        dataProvider.fetchGroups() { (groups, error) in
            // Error handling? Naaah, this stuff always works :D
            
            // Update the model with new data
            self.groupsList = GroupsList(groups: groups, groupsCategory: .joined)
        }
    }
}
