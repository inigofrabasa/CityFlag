//
//  DetailViewController.swift
//  Demo App
//
//  Created by Iñigo Flores Rabasa on 13/03/20.
//  Copyright © 2020 Iñigo Flores Rabasa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardInstanciable {
    
    @IBOutlet private weak var appImageView: UIImageView!
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var appDescriptionLabel: UILabel!
    @IBOutlet private weak var appLinkLabel: UILabel!
    @IBOutlet private weak var copyRigthsLabel: UILabel!
    
    
    private var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    func configure() {
        viewModel.appTitle.bind(to: appTitleLabel.reactive.text)
        viewModel.appDescription.bind(to: appDescriptionLabel.reactive.text)
        viewModel.appLink.bind(to: appLinkLabel.reactive.text)
        viewModel.appCopyRigths.bind(to: copyRigthsLabel.reactive.text)
        viewModel.appImage.bind(to: appImageView.reactive.image)
    }
    
}
