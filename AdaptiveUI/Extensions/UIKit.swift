//
//  UIKit.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//


import UIKit

extension AUILabel.Alignment {
    var uiAligment: NSTextAlignment {
        switch self {
        case .center:
            return .center
        case .left:
            return .left
        case .right:
            return .right
        }
    }
}

extension AUIOffset {
    var cgSize: CGSize {
        CGSize(width: x, height: y)
    }
}

extension AUIText {
    var uiFont: UIFont {
        let weight: UIFont.Weight
        switch fontWeight {
        case .light:
            weight = .light
        case .medium:
            weight = .medium
        case .regular:
            weight = .regular
        case .bold:
            weight = .bold
        }

        return .systemFont(ofSize: CGFloat(fontSize), weight: weight)
    }
}
