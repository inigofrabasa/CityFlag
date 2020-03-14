//
//  MainViewModel.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import Bond

struct MainViewModelDataSource: ViewModelDataSource {
    let context: Context
}

class MainViewModel {
    private let router: MainViewRouter
    private(set) var context: Context
    
    let apps = Observable<[Entry]>([])
    let titleView = Observable("")
    
    init(dataSource: MainViewModelDataSource, router: MainViewRouter) {
        self.context = dataSource.context
        self.router = router
        getInfo()
    }
    
    func getInfo() {
        self.context.apiService.getInformation(Success: { [weak self] (result) in
            guard let `self` = self else { return }
            self.setEntries(entryArray: result.entry ?? [], title: result.title?.label ?? "")
        }) { (error) in
            print("Error")
        }
    }
    
    func setEntries(entryArray: [Entry], title: String) {
        apps.value = entryArray
        titleView.value = title
    }
    
    func onTap(selected: Entry, logo: UIImage ) {
        let dataSource = DetailViewModelDataSource(context: context, entry: selected, logo: logo)
        router.routeToDetail(dataSource: dataSource)
    }
}
