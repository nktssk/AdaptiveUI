//
//  Defaults.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

// MARK: AUIInsets

extension AUIInsets {
    static let zero: AUIInsets = {
        let value = AUIInsets()
        value.top = .zero
        value.bottom = .zero
        value.left = .zero
        value.right = .zero
        return value
    }()
}

// MARK: AUISize

extension AUISize {
    static let zero: AUISize = {
        let value = AUISize()
        value.width = .zero
        value.height = .zero
        return value
    }()
}

// MARK: AUIOffset

extension AUIOffset {
    static let `default`: AUIOffset = {
        let value = AUIOffset()
        value.x = .zero
        value.y = -1
        return value
    }()
}

// MARK: Colors

extension AUIColor {

    public static let defaultTextColor: AUIColor = {
        let color = AUIColor()
        color.lightThemeColor = "#000000"
        color.darkThemeColor = "#FFFFFF"
        return color
    }()

    public static let defaultViewColor: AUIColor = {
        let color = AUIColor()
        color.lightThemeColor = "#FFFFFF"
        color.darkThemeColor = "#000000"
        return color
    }()

    public static let defaultImageBackgroundColor: AUIColor = {
        let color = AUIColor()
        color.lightThemeColor = "#DCDCE0"
        color.darkThemeColor = "#202022"
        return color
    }()

    public static let defaultButtonTintColor: AUIColor = {
        let color = AUIColor()
        color.lightThemeColor = "#3578F5"
        color.darkThemeColor = "#3B81F6"
        return color
    }()

    public static let defaultSearchBarTintColor: AUIColor = {
        let color = AUIColor()
        color.lightThemeColor = "#3578F5"
        color.darkThemeColor = "#3B81F6"
        return color
    }()
}
