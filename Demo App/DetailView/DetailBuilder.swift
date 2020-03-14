//
//  DetailBuilder.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

enum DetailBuilder {

    static func build(with dataSource: DetailViewModelDataSource) -> UIViewController {
        let viewController = DetailViewController.instantiate(from: .main)
        let router = DetailRouter(viewController: viewController)
        viewController.configure(with: DetailViewModel(dataSource: dataSource, router: router))
        return viewController
    }
}
