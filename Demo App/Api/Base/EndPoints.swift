//
//  EndPoints.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation

enum Endpoint {
    
    static var baseURL: URLComponents {
        var urlComponents = URLComponents()
        switch Environment.current {
        case .development:
            urlComponents.scheme = "https"
            urlComponents.host = "itunes.apple.com"
            urlComponents.path = "/us/rss/topfreeapplications/"
        case .production:
            urlComponents.scheme = "https"
            urlComponents.host = "itunes.apple.com"
            urlComponents.path = "/us/rss/topapplications/"
        }
        return urlComponents
    }
}
