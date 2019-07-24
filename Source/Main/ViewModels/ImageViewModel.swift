//
//  ImageViewModel.swift
//  AppBuilder
//
//  Created by Anton Boyarkin on 10/04/2019.
//

import Foundation
import Kingfisher
import IBACore

class ImageViewModel {
    
    private var item: ImageModel
    private var imageView = UIImageView()
    
    init(_ imageModel: ImageModel) {
        self.item = imageModel
        configure()
    }
    
    private func configure() {
        imageView = UIImageView(frame: item.getRect())
        
        if let urlString = item.data.url, let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }
    
    var getImageView: UIImageView {
        return imageView
    }
}
