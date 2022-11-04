//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIConfiguration: Serializable {

    // MARK: Nested Types

    enum ViewRepresentation: Codable {
        case view(configuration: AUIView)
        case label(configuration: AUILabel)
        case webView(configuration: AUIWebView)
        case textView(configuration: AUITextView)
        case imageView(configuration: AUIImageView)
        case progressView(configuration: AUIProgressView)
        case activityIndicator(configuration: AUIActivityIndicator)
    }

    // MARK: AdaptiveUI Configuration

    @Convertible
    var controller: AUIController?

    // MARK: Representation

    @Convertible
    var views: [ViewRepresentation]

    // MARK: Layout

    // let layout: [ViewRelation]
}
