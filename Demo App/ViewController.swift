//
//  ViewController.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }

    func makeRequest() {
        LibraryAPI.sharedInstance.getInformation(Success: { (result) in
            print(result.title)
        }) { (error) in
            print(error)
        }
    }

}

