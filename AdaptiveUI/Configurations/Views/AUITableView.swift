//
//  AUITableView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import Foundation
import UIKit

public final class AUITableView: AUIView {

    public struct Data: Serializable {
        enum Kind {
            case text(String)
            case image(String)
        }

        @Convertible
        var data: [String: Kind]

        @Convertible
        public var cellType: String

        @Convertible
        public var actionId: String

        public init() {}
    }

    @Convertible
    public var cellsTypes: [String: AUIView]

    @Convertible
    public var data: [Data]
}
