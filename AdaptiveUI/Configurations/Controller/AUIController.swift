//
//  AUIController.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIController: Serializable {

    // MARK: Nested Types

    enum Kind: String, Decodable {
        case table
        case `static`
        case scrollable
    }

    // MARK: AdaptiveUI Configuration

    @Convertible(default: .static)
    var kind: Kind

    // MARK: Configuration

    @Convertible
    var title: String?

    // MARK: Representation

    @Convertible(default: false)
    var largeTitle: Bool

    @Convertible
    var backgroundColor: AUIColor?

    // MARK: Layout

    @Convertible(default: false)
    var pinToSafeArea: Bool

    init() {}
}
