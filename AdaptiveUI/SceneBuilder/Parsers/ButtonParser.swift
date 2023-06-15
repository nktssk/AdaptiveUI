//
//  ButtonParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum ButtonParser {
    static func configure(configuration: AUIButton, viewController: AUIViewController) -> UIButton {
        let button = UIButton()
        
        if let text = configuration.text {
            button.setTitle(text.content, for: .normal)
            button.titleLabel?.font = text.uiFont
        }
        if let color = UIColor(from: configuration.textColor) {
            button.setTitleColor(color, for: .normal)
        }
        if let color = UIColor(from: configuration.tintColor) {
            button.tintColor = color
        }
        if let imageName = configuration.image?.imageName {
            button.setImage(UIImage(named: imageName), for: .normal)
        }
        if let imageURLString = configuration.image?.imageURL,
           let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                DispatchQueue.main.async() { [weak button] in
                    button?.setImage(image, for: .normal)
                }
            }.resume()
        }
        configuration.actionHandler.forEach { action in
            let actionWrapper = AUIActionWrapper { [weak viewController] in
                switch action {
                case .custom(let id):
                    viewController?.actions[id]?()
                case .standard(let type):
                    DispatchQueue.main.async {
                        BaseViewConfigurator.defaultAction(type: type, viewController: viewController)
                    }
                }
            }
            viewController.actionWrappers.append(actionWrapper)
            button.addTarget(actionWrapper, action: #selector(actionWrapper.action), for: .touchUpInside)
        }
        
        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .button(button)
        }
        
        BaseViewConfigurator.configure(
            view: button,
            configuration: configuration,
            viewController: viewController,
            skipActions: true
        )
        
        return button
    }
}
