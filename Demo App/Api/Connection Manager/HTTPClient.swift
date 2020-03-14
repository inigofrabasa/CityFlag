//
//  HTTPClient.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation

class HTTPClient: NSObject {
    
    static let sharedInstance = HTTPClient()
    private let session: URLSession
    private let config: URLSessionConfiguration
    private var request: NSMutableURLRequest?
    
    var params: Dictionary <String,AnyObject>?
    
    override init(){
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func doRequest(method: String, type: String, parameters: Dictionary<String, AnyObject>?, onSuccess: @escaping (Json4Swift_Base) -> (), onError: @escaping (NSError) -> ()) {
        
        prepareRequestWithMethod(method: method, type: type)
        
        let task = session.dataTask(with: request! as URLRequest, completionHandler: {(data, response, error) in
            if error != nil {
                onError(error! as NSError)
                return
            }
            let httpResponse = response as! HTTPURLResponse
            if (httpResponse.statusCode != 200) {
                onError(NSError(domain: "Unexpected", code: httpResponse.statusCode, userInfo: [:]))
                return
            }
            var responseObject: Json4Swift_Base?
            if (data?.count)! > 0 {
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data!)
                    responseObject = responseModel
                } catch {
                    print(error)
                }
            }
            onSuccess(responseObject!)
        })
        task.resume()
    }
    
    func doRequest(method: String, parameters: Dictionary<String, AnyObject>, onSuccess: @escaping (Json4Swift_Base) -> Void, onError: @escaping (NSError) -> Void) {
        doRequest(method: method, type: "POST", parameters: parameters, onSuccess: onSuccess , onError: onError)
    }
    
    func prepareRequestWithMethod(method: String, type: String) {
        var urlBuilder = Endpoint.baseURL
        urlBuilder.path += method
        guard let url = urlBuilder.url else { fatalError("Invalid URL") }
        request = NSMutableURLRequest(url: url as URL)
        request!.httpMethod = type as String
        request!.timeoutInterval = 30
    }
}
