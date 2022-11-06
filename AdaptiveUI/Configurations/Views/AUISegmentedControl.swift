//
//  AUISegmentedControl.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

final class AUISegmentedControl: AUIView {

    // MARK: Nested types

    enum Items: Codable {
        case titles(list: [String])
        case images(list: [AUIImage])
    }

    // MARK: Configuration

    @Convertible(default: .zero)
    var selectedSegmentIndex: Int

    @Convertible(default: .titles(list: []))
    var items: Items
}
