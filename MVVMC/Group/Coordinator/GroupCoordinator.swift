//
//  GroupCoordinator.swift
//  MVVMC
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

protocol GroupCoordinatorProtocol: class {
    func showMembers()
}

final class GroupCoordinator: GroupCoordinatorProtocol {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func showMembers() {
        // Show members in a new screen 
    }
}
