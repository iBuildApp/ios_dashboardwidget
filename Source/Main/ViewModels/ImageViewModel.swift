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
    
    init(_ imageModel: ImageModel, in size: CGSize? = nil) {
        self.item = imageModel
        configure(size)
    }
    
    private func configure(_ size: CGSize? = nil) {
        imageView = UIImageView(frame: item.getRect(size))
        
        if let urlString = item.data.url, let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
    }
    
    var getImageView: UIImageView {
        return imageView
    }
}
