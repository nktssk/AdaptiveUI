//
//  AUISearchBar.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public final class AUISearchBar: AUIView {

    public enum SearchStyle: String, Codable {
        case `default`
        case prominent
        case minimal
    }

    @Convertible
    public var text: AUIText

    @Convertible
    public var prompt: String?

    @Convertible
    public var placeholder: String?

    @Convertible
    public var barTintColor: AUIColor?

    @Convertible(default: .default)
    public var searchBarStyle: SearchStyle

    @Convertible(default: .defaultSearchBarTintColor)
    public var tintColor: AUIColor

    @Convertible(default: true)
    public var isTranslucent: Bool
}
