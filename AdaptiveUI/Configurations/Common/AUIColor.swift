//
//  AUIColor.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIColor: Serializable {
    @Convertible
    public var darkThemeColor: String?

    @Convertible
    public var lightThemeColor: String

    public init() {}
}
