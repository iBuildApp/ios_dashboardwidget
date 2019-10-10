//
//  MainViewModel.swift
//  AppBuilder
//
//  Created by Vitaly Potlov on 06/04/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import UIKit
import IBACore

class MainViewModel {
    
    private var buttons: [ButtonViewModel]?
    private var labels: [LabelViewModel]?
    private var images: [ImageViewModel]?
    
    func setupButtons(from items: [ButtonModel], in size: CGSize? = nil) {
        buttons = items.map { return ButtonViewModel($0, in: size) }
    }
    
    func setupLabels(from items: [LabelModel], in size: CGSize? = nil) {
        labels = items.map { return LabelViewModel($0, in: size) }
    }
    
    func setupImages(from items: [ImageModel], in size: CGSize? = nil) {
        images = items.map { ImageViewModel($0, in: size) }
    }
    
    func getButtons() -> [ButtonViewModel] {
        guard let buttons = self.buttons else { return [] }
        return buttons
    }
    
    func getLabels() -> [LabelViewModel] {
        guard let labels = self.labels else { return [] }
        return labels
    }
    
    func getImages() -> [ImageViewModel] {
        guard let images = self.images else { return [] }
        return images
    }
}
