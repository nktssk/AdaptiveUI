//
//  AUISegmentedControl.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public final class AUISegmentedControl: AUIView {

    // MARK: Nested types

    public enum Items: Codable {
        case titles(list: [String])
        case images(list: [AUIImage])
    }

    // MARK: Configuration

    @Convertible(default: .zero)
    public var selectedSegmentIndex: Int

    @Convertible(default: .titles(list: []))
    public var items: Items
}

