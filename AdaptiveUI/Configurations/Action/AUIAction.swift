//
//  AUIAction.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import Foundation

public enum AUIAction {
    public enum StandardActionType: Codable {
        case alert(title: String, message: String)
        case openWebURL(url: String)
        case openScreen(url: String)
    }

    case custom(id: String)
    case standard(type: StandardActionType)
}
