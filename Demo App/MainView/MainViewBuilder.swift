//
//  MainViewBuilder.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import UIKit

enum MainBuilder {

    static func build(with dataSource: MainViewModelDataSource) -> UIViewController {
        let viewController = MainViewController.instantiate(from: .main)
        let router = MainViewRouter(viewController: viewController)
        viewController.configure(with: MainViewModel(dataSource: dataSource, router: router))
        return viewController
    }
}
