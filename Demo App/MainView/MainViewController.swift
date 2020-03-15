//
//  MainViewController.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit
import Bond

class MainViewController: UIViewController, StoryboardInstanciable{
    
    @IBOutlet weak var appsTableview: UITableView!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(with viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func configure() {
        _ = viewModel.titleView.observeNext { [weak self] (title) in
            DispatchQueue.main.async {
                self?.title = title
            }
        }
        _ = viewModel.storedApps.bind(to: appsTableview) { (apps, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppTableViewCell", for: indexPath) as! AppTableViewCell
            let dataSource = AppTableViewCellModelDataSource(entry: apps[indexPath.row])
            cell.configure(with: AppTableViewCellModel(dataSource: dataSource))
            return cell
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApp = viewModel.storedApps.value[indexPath.row]
        let currentCell = tableView.cellForRow(at: indexPath) as? AppTableViewCell
        let logo = currentCell?.appImageView.image
        viewModel.onTap(selected: selectedApp, logo: logo!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
