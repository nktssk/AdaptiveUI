//
//  AUITextView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUITextView: AUILabel {

    @Convertible(default: false)
    var isEditable: Bool

    @Convertible(default: true)
    var isSelectable: Bool
}
