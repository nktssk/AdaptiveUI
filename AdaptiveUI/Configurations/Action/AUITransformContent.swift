//
//  AUITransformContent.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 08.04.2023.
//

import Foundation

public struct AUITransformContent: Serializable, Equatable {

    @Convertible
    public var id: String
    
    @Convertible(default: [])
    public var params: [AUITransformParams]
    
    @Convertible(default: .zero)
    public var duration: CGFloat

    public init() {}
    
    public static func == (lhs: AUITransformContent, rhs: AUITransformContent) -> Bool {
        lhs.id == rhs.id && lhs.params == rhs.params
    }
}

public enum AUITransformParams: Codable, Equatable {
    case hide(value: Bool)
    case color(value: String)
    case alpha(value: CGFloat)
    case userIntraction(value: Bool)
    case cornerRadius(value: CGFloat)
    
    case isOn(value: Bool)
    
    case text(value: String)
    case textAligment(value: AUILabel.Alignment)
    case placeholder(value: String)
    case editable(value: Bool)
    
    case image(value: String)
    case imageContentMode(value: AUIImageView.ContentMode)
    
    case progress(value: CGFloat)
    
    case tableViewReload(value: [CellData])
}
