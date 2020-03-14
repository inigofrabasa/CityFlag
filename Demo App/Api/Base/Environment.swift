//
//  Environment.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation

enum Environment {
    
    case development
    case production
    
#if ENV_PROD
    static var current: Environment = .production
#else
    static var current: Environment = .development
#endif
}

