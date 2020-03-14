//
//  AppDelegate.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let coordinator = ApplicationCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        coordinator.initialize(on: window!, application, and: launchOptions)
        return true
    }
}

