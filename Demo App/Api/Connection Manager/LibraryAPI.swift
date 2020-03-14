//
//  LibraryAPI.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation

class LibraryAPI {
    typealias Model = Feed

    static let sharedInstance = LibraryAPI()
    
    func getInformation(Success onSuccess:@escaping (Feed) -> (), onError: @escaping (String) -> ()) {
        #if DEBUG
            let method = "limit=20/json"
        #else
            let method = "limit=5/json"
        #endif
        
        HTTPClient.sharedInstance.doRequest(method:method , type: "GET", parameters: nil, onSuccess: {(data) in
            if let info = data.feed {
                onSuccess(info)
            } else {
                onError("Missing Info")
            }
        }, onError: {(error) in
            onError(error.description)
        })
    }
}

extension LibraryAPI {
    func makeModel(fromData data: Data) throws -> Model {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(Model.self, from: data)
    }
}
