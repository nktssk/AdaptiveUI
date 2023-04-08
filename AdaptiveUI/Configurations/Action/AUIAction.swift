//
//  AUIAction.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import Foundation

public enum AUIAction: Codable, Equatable {
    public enum StandardActionType: Codable, Equatable {
        case alert(title: String, message: String, buttonText: String)
        case openWebURL(url: String)
        case openScreen(url: String)
        case transform(content: AUITransformContent)
    }

    case custom(id: String)
    case standard(type: StandardActionType)
}
