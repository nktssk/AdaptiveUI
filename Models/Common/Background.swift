//
//  Background.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public enum Background: Decodable {
    case empty
    case solid(color: String)
    case image(url: URL, stubColor: String)
}
