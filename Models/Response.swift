//
//  Response.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

struct Response: Decodable {
    let views: [View]
    let layouts: [Layout]
}

public enum View: Decodable {
    case label(Label)
    case baseView(BaseView)
}
