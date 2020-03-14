//
//  Demo_AppTests.swift
//  Demo AppTests
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import XCTest
@testable import Demo_App


class Demo_AppTests: XCTestCase {
    
    func testMainView() {
        let context = Context(apiService: LibraryAPI())
        let mainDataSource = (MainViewModelDataSource(context: context))
        let viewController = MainBuilder.build(with: mainDataSource)
        XCTAssert(viewController.isKind(of: MainViewController.self))
    }
    
    func testResponseAPI () {
        LibraryAPI.sharedInstance.getInformation(Success: { (response) in
            XCTAssert(response.entry != nil)
        }) { (error) in
        }
    }
    
}
