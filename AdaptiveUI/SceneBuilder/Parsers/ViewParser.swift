//
//  ViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit
import SafariServices

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
        view.clipsToBounds = true
        view.backgroundColor = UIColor(from: configuration.backgroundColor)
        view.accessibilityIdentifier = configuration.accessibilityIdentifier

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .view(view)
        }

        guard !configuration.actionHandler.isEmpty, !skipActions else { return }
        
        configuration.actionHandler.forEach { action in
            let actionWrapper = AUIActionWrapper { [weak viewController] in
                switch action {
                case .custom(let id):
                    viewController?.actions[id]?()
                case .standard(let type):
                    DispatchQueue.main.async {
                        Self.defaultAction(type: type, viewController: viewController)
                    }
                }
            }
            viewController.actionWrappers.append(actionWrapper)
            let tapGestureRecognizer = UITapGestureRecognizer(
                target: actionWrapper,
                action: #selector(actionWrapper.action)
            )
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(tapGestureRecognizer)
        }
    }

    static func defaultAction(type: AUIAction.StandardActionType, viewController: AUIViewController?) {
        switch type {
        case .alert(let title, let message, let buttonText, let actions):
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: buttonText, style: UIAlertAction.Style.default, handler: { _ in
                actions.forEach { action in
                    switch action {
                    case .custom(let id):
                        viewController?.actions[id]?()
                    case .standard(let type):
                        DispatchQueue.main.async {
                            Self.defaultAction(type: type, viewController: viewController)
                        }
                    }
                }
            }))
            viewController?.present(alert, animated: true)

        case .openWebURL(let url):
            guard let url = URL(string: url) else { return }
            let sfViewController = SFSafariViewController(url: url)
            if let navigationController = viewController?.navigationController {
                navigationController.pushViewController(sfViewController, animated: true)
            } else {
                viewController?.present(sfViewController, animated: true)
            }

        case .openScreen(let url):
            guard let url = URL(string: url) else { return }
            UIApplication.shared.open(url)

        case .transform(let content):
            guard let viewEnum = viewController?.viewHierarchy[content.id] else { return }
            
            UIView.animate(withDuration: TimeInterval(content.duration)) {
                for param in content.params {
                    AUITransformHandler.applyTransform(for: viewEnum, transform: param, viewController: viewController)
                }
            }
        case .dismiss(let time):
            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
                viewController?.dismiss(animated: true)
                viewController?.navigationController?.popViewController(animated: true)
            }
        }
    }
}
