//
//  GroupsList.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

struct GroupsList: Equatable {
    let groups: [Group]
    let groupsCategory: GroupCategory
    
    static func == (lhs: GroupsList, rhs: GroupsList) -> Bool {
        return lhs.groups == rhs.groups && lhs.groupsCategory == rhs.groupsCategory
    }
    
    enum GroupCategory {
        case joined
        case invited
        case suggested
        
        var localizedString: String {
            switch self {
            case .invited:
                return NSLocalizedString("Invitations", comment: "")
            case .joined:
                return NSLocalizedString("My groups", comment: "")
            case .suggested:
                return NSLocalizedString("Suggested groups", comment: "")
            }
        }
    }
}

struct Group: Equatable {
    let id: String
    let name: String
    let members: [User]
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.members == rhs.members
    }
}

struct User: Equatable {
    let id: String
    let firstName: String
    let lastName: String
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}

