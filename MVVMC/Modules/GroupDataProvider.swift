//
//  GroupDataProvider.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import Foundation

class GroupDataProvider {
    
    // Provides data e.g. from database or network
    static let shared = GroupDataProvider()
    
    func fetchGroups(completion: (_ groups: [Group], _ error: Error?) -> Void) {
        let groups = (1...50).map { id in Group(id: "\(id)", name: "My group \(id)", members: []) }
        completion(groups, nil)
    }
}
