//
//  AUIImage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIImage: Serializable {
    @Convertible
    public var imageName: String?

    @Convertible
    public var imageURL: String?

    public init() {}
}
