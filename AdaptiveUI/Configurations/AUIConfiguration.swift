//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIConfiguration: Serializable {

    // MARK: AdaptiveUI Configuration

    @Convertible
    var controller: AUIController?

    // MARK: Representation

    @Convertible
    var views: [ViewConfiguration]

    // MARK: Layout

    // let layout: [ViewRelation]
}
