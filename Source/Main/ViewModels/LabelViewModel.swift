//
//  LabelViewModel.swift
//  AppBuilder
//
//  Created by Vitaly Potlov on 06/04/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import Foundation
import IBACore

class LabelViewModel {
    
    private var item: LabelModel
    private var label = UILabel()

    init(_ label: LabelModel, in size: CGSize? = nil) {
        self.item = label
        configureLabel(size)
    }
    
    private func configureLabel(_ size: CGSize? = nil) {
        label = UILabel(frame: item.getRect(size))
        label.text = item.data.title
        
        if let font = item.data.getFont() {
            label.font = font
        }
        
        if let alignment = item.data.align {
            label.textAlignment = alignment.native()
        }
        
        if let color = item.data.color?.getColor() {
            label.textColor = color
        }
    }
    
    var getLabel: UILabel {
        return label
    }
}
