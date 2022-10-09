//
//  Layout.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public struct Layout: Decodable {
    public let source: String
    public let destination: String?
    public let value: Double?

    public enum RelativeType: Decodable {
        case object
        case constant
    }
    public enum LayoutType: Decodable {
        case top
        case bottom
        case leading
        case trailing

        case width
        case height
        case aspectRation

        case centerX
        case centerY
    }
}
