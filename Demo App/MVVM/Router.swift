//
//  Router.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import UIKit


protocol Router {
    var viewController: UIViewController? { get }
    func routeBack()
}

extension Router {
    func routeBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func push(viewController: UIViewController) {
          self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
