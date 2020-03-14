//
//  ApplicationCoordinator.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator {
    
    private lazy var context: Context = {
        let libraryApi = LibraryAPI()
        return Context(apiService: libraryApi)
    }()
    
    func initialize(on window: UIWindow, _ application: UIApplication, and launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        startApplication(on: window)
    }
    
    func startApplication(on window: UIWindow) {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        startMainFlow(on: navigationController)
    }
    
    func startMainFlow(on navigationController: UINavigationController) {
        let mainViewModelDataSource = MainViewModelDataSource(context: context)
        let viewController = MainBuilder.build(with: mainViewModelDataSource)
        navigationController.viewControllers = [viewController]
    }
}
