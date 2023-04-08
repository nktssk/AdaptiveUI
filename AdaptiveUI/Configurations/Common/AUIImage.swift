//
//  AUIImage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIImage: Serializable, Equatable {
    @Convertible
    public var imageName: String?

    @Convertible
    public var imageURL: String?

    public init() {}
    
    public static func == (lhs: AUIImage, rhs: AUIImage) -> Bool {
        lhs.imageName == rhs.imageName && lhs.imageURL == rhs.imageURL
    }
}
