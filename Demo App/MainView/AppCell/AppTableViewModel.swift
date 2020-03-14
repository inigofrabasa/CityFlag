//
//  AppTableViewModel.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import Bond

struct AppTableViewCellModelDataSource {
    let entry: Entry
}

class AppTableViewCellModel {
    private let entry: Entry
    let appName: Observable<String?>
    let appDescription: Observable<String?>
    let appPrice: Observable<String?>
    let appImage = Observable<UIImage?>(UIImage(named: "app_placeholder"))
    
    init(dataSource: AppTableViewCellModelDataSource) {
        entry = dataSource.entry
        appName = Observable(entry.name?.label ?? "")
        appDescription = Observable(entry.summary?.label ?? "")
        appPrice = Observable(entry.price?.label ?? "")
        getImage(from: entry.image?.first?.label ?? "")
    }
    
    func getImage(from url: String) {
        if url.isEmpty {
            appImage.value = UIImage(named: "app_placeholder")!
        } else {
            downloadImage(from: URL(string: url)!)
        }
        appImage.value = UIImage(named: "app_placeholder")!
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            self.appImage.value = UIImage(data: data)
        }
    }
}
