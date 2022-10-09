//
//  Text.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public enum FontWeight: Decodable {
    case light
    case medium
    case bold
    case normal
    case heavy
}

public class Label: BaseView, TextRepresentable {
    // Required
    public let text: String
    public let fontSize: Int
    public let textColor: String
    public let fontWeight: FontWeight

    // Initialiser
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let superDecoder = try container.superDecoder()
        text = try container.decode(String.self, forKey: .text)
        fontSize = try container.decode(Int.self, forKey: .fontSize)
        textColor = (try? container.decode(String.self, forKey: .textColor)) ?? Defaults.blackColor
        fontWeight = (try? container.decode(FontWeight.self, forKey: .fontWeight)) ?? Defaults.normalWeight
        try super.init(from: superDecoder)
    }

    // Coding Keys
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case fontSize = "fontSize"
        case textColor = "textColor"
        case fontWeight = "fontWeight"
    }
}
