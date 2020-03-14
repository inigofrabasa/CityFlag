//
//  StoryboardInstanciable.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

protocol StoryboardInstanciable {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension StoryboardInstanciable where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        let moduleClassName = NSStringFromClass(self)
        let className = moduleClassName.components(separatedBy: ".").last!
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
