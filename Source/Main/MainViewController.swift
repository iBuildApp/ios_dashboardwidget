//
//  MainViewController.swift
//  AppBuilder
//
//  Created by Vitaly Potlov on 05/04/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import UIKit
import IBACore
import IBACoreUI
import PinLayout

class MainViewController: BaseViewController {
    
    private var viewModel: MainViewModel!
    
    private let contentView = UIView()
    private let backgroundImageView = UIImageView()
    
    // MARK: - Private properties
    /// Widget type indentifier
    private var type: String?
    
    /// Widger config data
    private var data: DataModel?
    
    // MARK: - Controller life cycle methods
    public convenience init(type: String?, data: DataModel?) {
        self.init()
        self.type = type
        self.data = data
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainViewModel()
        
        view.sv(backgroundImageView, contentView)
        
        backgroundImageSetup()
        
        buttonsSetup()
        labelsSetup()
        imagesSetup()
        
        if let ids = data?.buttons?.map({ item -> String in return item.widgetId }) {
            AppManager.manager.preloadWidgets(ids)
        }
    }
    
    override func viewDidLayoutSubviews() {
        backgroundImageView.pin.all()
        contentView.pin.all(view.pin.safeArea)
    }
    
    private func backgroundImageSetup() {
        guard let appSettings = AppManager.manager.appModel() else { return }
        
        if let hexString = appSettings.design?.color {
            backgroundImageView.backgroundColor = UIColor(withHexString: hexString)
        }
        
        guard let imageUrl = appSettings.design?.backimagex else { return }
        
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.kf.setImage(with: URL(string: imageUrl), options: [.transition(.fade(0.2))])
    }
    
    private func buttonsSetup() {
        guard let buttons = data?.buttons else { return }
        viewModel.setupButtons(from: buttons)
        viewModel.getButtons().forEach { self.contentView.addSubview( $0.getButton ) }
    }
    
    private func labelsSetup() {
        guard let labels = data?.labels else { return }
        viewModel.setupLabels(from: labels)
        viewModel.getLabels().forEach { self.contentView.addSubview( $0.getLabel ) }
    }
    
    private func imagesSetup() {
        guard let images = data?.images else { return }
        viewModel.setupImages(from: images)
        viewModel.getImages().forEach { self.contentView.addSubview( $0.getImageView ) }
    }
}
