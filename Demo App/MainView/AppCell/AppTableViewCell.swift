//
//  AppTableViewCell.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var appDescriptionLabel: UILabel!
    
    private var viewModel: AppTableViewCellModel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: AppTableViewCellModel) {
        self.viewModel = viewModel
        configure()
    }
}

private extension AppTableViewCell {

    func configure() {
        viewModel.appName.bind(to: appTitleLabel.reactive.text)
        viewModel.appDescription.bind(to: appDescriptionLabel.reactive.text)
        viewModel.appImage.bind(to: appImageView.reactive.image)
    }
    
}
