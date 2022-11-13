//
//  AUISearchBar.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

final class AUISearchBar: AUIView {

    enum SearchStyle: String, Codable {
        case `default`
        case prominent
        case minimal
    }

    @Convertible
    var text: AUIText

    @Convertible
    var prompt: String?

    @Convertible
    var placeholder: String?

    @Convertible
    var barTintColor: AUIColor?

    @Convertible(default: .default)
    var searchBarStyle: SearchStyle

    @Convertible(default: .defaultSearchBarTintColor)
    var tintColor: AUIColor

    @Convertible(default: true)
    var isTranslucent: Bool
}
