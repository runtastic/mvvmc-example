//
//  UnitTests.swift
//  UnitTests
//
//  Created by Adam Studenic on 03/08/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import XCTest

final class GroupsViewModelTests: XCTestCase {
    
    private var interactor: GroupsFakeInteractor!
    private var coordinator: GroupsFakeCoordinator!
    private var viewModel: GroupsViewModel!
    
    override func setUp() {
        super.setUp()
        
        interactor = GroupsFakeInteractor()
        coordinator = GroupsFakeCoordinator()
        viewModel = GroupsViewModel(interactor: interactor, coordinator: coordinator)
    }
    
    override func tearDown() {
        interactor = nil
        coordinator = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchUserGroups() {
        let exp = expectation(description: "Fetch groups")
        
        // This completion block should be called when groups are fetched
        interactor.groupsListDidChange.add { [weak interactor] in
            XCTAssertEqual(interactor?.groupsList.groups.count, 50)
            exp.fulfill()
        }
        
        // Fetch mocked user groups
        viewModel.fetchGroups()
        
        waitForExpectations(timeout: 2.0, handler: nil)
    }
}

// MARK: Mocked interactor

class GroupsFakeInteractor: GroupsInteractorProtocol {
    var groupsListDidChange = ObserverSet<Void>()
    
    var groupsList = GroupsList(groups: [], groupsCategory: .joined)
    
    func fetchGroups() {
        groupsList = GroupsList(groups: (0..<50).map { _ in Group(id: "0", name: "Test", members: []) }, groupsCategory: .joined)
        groupsListDidChange.notify()
    }
}

// MARK: Mocked coordinator

class GroupsFakeCoordinator: GroupsCoordinatorProtocol {
    var presented = false
    var dismissed = false
    
    func present(group: Group) {
        presented = true
    }
    
    func dismissGroup() {
        dismissed = true
    }
}

