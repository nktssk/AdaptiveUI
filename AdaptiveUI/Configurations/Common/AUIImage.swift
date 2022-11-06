//
//  AUIImage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIImage: Serializable {
    @Convertible
    var imageName: String?

    @Convertible
    var imageURL: String?
}
