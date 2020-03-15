//
//  MainViewModel.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import Foundation
import CoreData
import Bond

struct MainViewModelDataSource: ViewModelDataSource {
    let context: Context
}

class MainViewModel {
    private let router: MainViewRouter
    private(set) var context: Context
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let coreDatacontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let storedApps = Observable<[AppEntity]>([])
    let titleView = Observable("")
    
    init(dataSource: MainViewModelDataSource, router: MainViewRouter) {
        self.context = dataSource.context
        self.router = router
        if Reachability.isConnectedToNetwork() {
            getInfo()
        } else {
            fetchInfoFromCoreData()
        }
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
        titleView.value = title
        if !entryArray.isEmpty {
            storedApps.value = saveInfoInCoreData(result: entryArray)
        }
    }
    
    func onTap(selected: AppEntity, logo: UIImage ) {
        let dataSource = DetailViewModelDataSource(context: context, entry: selected, logo: logo)
        router.routeToDetail(dataSource: dataSource)
    }
    
    func fetchInfoFromCoreData() {
        do {
            storedApps.value = try coreDatacontext.fetch(AppEntity.fetchRequest())
            titleView.value = "No conection, stored values"
        } catch let error as NSError {
            debugPrint("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func saveInfoInCoreData(result: [Entry]) -> [AppEntity] {
         emptyCoreData()
        var array = [AppEntity]()
        for element in result {
            let appData = AppEntity(entity: AppEntity.entity(), insertInto: coreDatacontext)
            appData.name = element.name?.label ?? ""
            appData.image = element.image?.first?.label ?? ""
            appData.releaseDate = element.releaseDate?.label ?? ""
            appData.rigths = element.rights?.label ?? ""
            appData.summary = element.summary?.label ?? ""
            array.append(appData)
        }
        appDelegate.saveContext()
        return array
    }
    
    func emptyCoreData() {
        do {
            let objects = try coreDatacontext.fetch(AppEntity.fetchRequest())
            for obj in objects {
                coreDatacontext.delete(obj as! NSManagedObject)
            }
        } catch let error as NSError {
            debugPrint("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
