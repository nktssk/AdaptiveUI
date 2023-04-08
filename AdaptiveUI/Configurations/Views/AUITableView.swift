//
//  AUITableView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import Foundation
import UIKit

public final class AUITableView: AUIView {

    public struct Data: Serializable, Equatable {
        public enum Kind: Codable, Equatable {
            case text(content: String, actionId: String? = nil)
            case image(url: String, actionId: String? = nil)
            case button(content: String, actionId: String? = nil)
            case `switch`(isOn: Bool, actionId: String? = nil)

            var actionId: String? {
                switch self {
                case .text(_, let actionId): return actionId
                case .image(_, let actionId): return actionId
                case .button(_, let actionId): return actionId
                case .`switch`(_, let actionId): return actionId
                }
            }
        }

        @Convertible
        public var identifierToData: [String: Kind]

        @Convertible
        public var cellType: String

        @Convertible
        public var selectActionId: String?

        public init() {}
        
        public static func == (lhs: AUITableView.Data, rhs: AUITableView.Data) -> Bool {
            lhs.identifierToData == rhs.identifierToData
        }
    }

    @Convertible
    public var cellsTypes: [String: AUITableViewCell]

    @Convertible
    public var data: [Data]

    @Convertible(default: true)
    public var isSeparatorHidden: Bool
}

public class AUITableViewCell: AUIView {

    @Convertible
    public var layout: [AUIConstraint]

    public required init() {}
}
