//
//  DetailRouter.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasaon 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: Router {
    internal weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
