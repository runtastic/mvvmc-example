//
//  GroupInteractor.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

protocol GroupInteractorProtocol: class {
    init(group: Group)
    
    var group: Group { get }
    var groupMembersDidChange: ObserverSet<Void> { get }
    
    func add(user: User)
    func remove(user: User)
}

final class GroupInteractor: GroupInteractorProtocol {
    
    private(set) var group: Group
    
    var groupMembersDidChange = ObserverSet<Void>()
    
    init(group: Group) {
        self.group = group
    }
    
    func add(user: User) {
        // Add user to the group
        var newMembers = group.members
        newMembers.append(user)
        group = Group(id: group.id, name: group.name, members: newMembers)
        
        groupMembersDidChange.notify()
    }
    
    func remove(user: User) {
        // Remove user from the group
        var newMembers = group.members
        guard let indexOfUser = newMembers.index(of: user) else {
            return
        }
        newMembers.remove(at: indexOfUser)
        group = Group(id: group.id, name: group.name, members: newMembers)
        
        groupMembersDidChange.notify()
    }
}
