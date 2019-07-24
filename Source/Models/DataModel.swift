//
//  DataModel.swift
//  HTMLWidget
//
//  Created by Anton Boyarkin on 16/04/2019.
//

import Foundation
import IBACore

internal struct DataModel: Codable {
    public var images: [ImageModel]?
    public var buttons: [ButtonModel]?
    public var labels: [LabelModel]?
    
    enum CodingKeys: String, CodingKey {
        case images = "image"
        case buttons = "button"
        case labels = "label"
    }
}
