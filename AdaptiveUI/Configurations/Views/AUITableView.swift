//
//  AUITableView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import Foundation
import UIKit

public final class AUITableView: AUIView {

    @Convertible
    public var cellsTypes: [String: AUIViewCell]

    @Convertible
    public var data: [CellData]

    @Convertible(default: true)
    public var isSeparatorHidden: Bool
}

public class AUIViewCell: AUIView {

    @Convertible
    public var layout: [AUIConstraint]

    public required init() {}
}

public struct CellData: Serializable, Equatable {
    public enum Kind: Codable, Equatable {
        case text(content: String, actionId: String? = nil)
        case image(url: String? = nil, localImage: String? = nil, actionId: String? = nil)
        case button(content: String, actionId: String? = nil)
        case `switch`(isOn: Bool, actionId: String? = nil)
        case backgroundColor(String)

        var actionId: String? {
            switch self {
            case .text(_, let actionId): return actionId
            case .image(_, _, let actionId): return actionId
            case .button(_, let actionId): return actionId
            case .`switch`(_, let actionId): return actionId
            case .backgroundColor(_): return nil
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
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.identifierToData == rhs.identifierToData
    }
}
