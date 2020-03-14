//
//  Context.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation

final class Context {
    let apiService: LibraryAPI
    
    init(apiService: LibraryAPI) {
        self.apiService = apiService
    }
}
