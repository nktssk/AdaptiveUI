//
//  Builder.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 04.12.2022.
//

import SwiftUI
@testable import AdaptiveUI

struct ViewControllerPreview: PreviewProvider {

    static var configuration: AUIConfiguration {
        .generate { configuration in
            configuration.views = self.views
            configuration.layout = self.layout
            configuration.controller = self.controller
        }
    }

    static var controller: AUIController {
        .generate { _ in }
    }

    static var layout: [AUIConstraint] = [
        .generate { constraint in
            constraint.target = "activityIndicator"
            constraint.targetAnchor = .centerX
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerX
            })
        },
        .generate { constraint in
            constraint.target = "activityIndicator"
            constraint.targetAnchor = .centerY
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerY
            })
        },
        .generate { constraint in
            constraint.target = "Label"
            constraint.targetAnchor = .centerX
            constraint.kind = .relation(configuration: .generate { config in
                config.sourceAnchor = .centerX
            })
        },
        .generate { constraint in
            constraint.target = "Label"
            constraint.targetAnchor = .top
            constraint.kind = .relation(configuration: .generate { config in
                config.source = "activityIndicator"
                config.sourceAnchor = .bottom
                config.constant = 10
            })
        },
    ]

    static var views: [ViewConfiguration] = [
        .activityIndicator(configuration: .generate { activityIndicator in
            activityIndicator.identifier = "activityIndicator"
            activityIndicator.color = .defaultTextColor
        }),
        .label(configuration: .generate { label in
            label.text = AUIText()
            label.backgroundColor = .defaultViewColor
            label.text.content = "Example"
            label.identifier = "Label"
            label.maxNumberOfLines = 1
        })
    ]

    static var previews: some View {
        let viewController = SceneBuilder.parse(configuration: self.configuration)
        viewController.view.layoutSubviews()
        return UINavigationController(rootViewController: viewController)
            .preview
    }
}
