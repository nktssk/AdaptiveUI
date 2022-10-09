//
//  TextRepresentable.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public protocol TextRepresentable: Decodable {
    var text: String { get }
    var fontSize: Int { get }
    var textColor: String { get }
    var fontWeight: FontWeight { get }
}
