//
//  ViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum BaseViewConfigurator {
    static func configure(
        view: UIView,
        configuration: AUIView,
        viewController: AUIViewController,
        skipActions: Bool = false
    ) {
        view.alpha = configuration.alpha
        view.isHidden = configuration.isHidden
        view.layer.cornerRadius = configuration.cornerRadius
        view.backgroundColor = UIColor(from: configuration.backgroundColor)
        view.accessibilityIdentifier = configuration.accessibilityIdentifier

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .view(view)
        }

        guard let action = configuration.actionHandler, !skipActions else { return }
        switch action {
        case .custom(let id):
            let actionWrapper = AUIActionWrapper { [weak viewController] in
                viewController?.actions[id]?()
            }
            viewController.actionWrappers.append(actionWrapper)
            let tapGestureRecognizer = UITapGestureRecognizer(
                target: actionWrapper,
                action: #selector(actionWrapper.action)
            )
            view.addGestureRecognizer(tapGestureRecognizer)
        case .standard(let type):
            // TODO: Later
            print(type)
        }
    }
}
