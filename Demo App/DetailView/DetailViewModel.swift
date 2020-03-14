//
//  DetailViewModel.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import Bond

struct DetailViewModelDataSource: ViewModelDataSource {
    let context: Context
    let entry: Entry
    let logo: UIImage
}

class DetailViewModel {
    private let router: DetailRouter
    private(set) var context: Context
    private var entry: Entry
    
    let appTitle = Observable("")
    let appDescription = Observable("")
    let appLink = Observable("")
    let appCopyRigths = Observable("")
    let appImage = Observable<UIImage?>(UIImage(named: "app_placeholder"))

    
    init(dataSource: DetailViewModelDataSource, router: DetailRouter) {
        self.context = dataSource.context
        self.router = router
        self.entry = dataSource.entry
        self.appImage.value = dataSource.logo
        configure()
    }
}

private extension DetailViewModel {
    func configure() {
        appTitle.value = entry.name?.label ?? ""
        appDescription.value = entry.summary?.label ?? ""
        appLink.value = "Release Date: " + self.prettyDate(current: (entry.releaseDate?.label)!)
        appCopyRigths.value = entry.rights?.label ?? ""
    }
    
    func prettyDate(current: String) -> String {
        return current.isEmpty ? "N/A" : String(current.prefix(10))
    }
}
