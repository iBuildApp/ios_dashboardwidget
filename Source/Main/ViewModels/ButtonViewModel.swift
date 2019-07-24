//
//  ButtonViewModel.swift
//  AppBuilder
//
//  Created by Vitaly Potlov on 06/04/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import Foundation
import Kingfisher
import IBACore

class ButtonViewModel {
    
    private var item: ButtonModel!
    private var button = UIButton()
    
    init(_ button: ButtonModel) {
        self.item = button
        configureButton()
    }
    
    private func configureButton() {
        button = UIButton(frame: item.getRect())
        if let label = item.label {
            button.setTitle(label, for: .normal)
            
            if let font = item.getFont() {
                button.titleLabel?.font = font
            }
            
            if let alignment = item.align {
                button.titleLabel?.textAlignment = alignment.native()
            }
            
            if let color = item.color?.getColor() {
                button.setTitleColor(color, for: .normal)
            }
        }
        
        if let urlString = item.icon, let url = URL(string: urlString) {
            self.button.kf.setBackgroundImage(with: url, for: .normal)
        }
        
        button.addTarget(self, action: #selector(self.action), for: .touchUpInside)
    }
    
    var getButton: UIButton {
        return button
    }
    
    @objc func action() {
        AppManager.manager.showWidget(by: item.widgetId)
    }
}
