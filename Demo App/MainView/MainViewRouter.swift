//
//  MainViewRouter.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import UIKit

class MainViewRouter: Router {
    internal weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func routeToDetail(dataSource: DetailViewModelDataSource) {
        push(viewController: DetailBuilder.build(with: dataSource))
    }
}
