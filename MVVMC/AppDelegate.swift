//
//  AppDelegate.swift
//  MVVMC
//
//  Created by Adam Studenic on 28/07/2017.
//  Copyright © 2017 runtastic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = RootCoordinator.presentGroups()
        window?.makeKeyAndVisible()
        
        return true
    }
}

