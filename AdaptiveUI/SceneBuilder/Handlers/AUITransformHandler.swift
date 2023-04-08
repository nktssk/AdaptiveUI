//
//  AUITransformHandler.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 08.04.2023.
//

import Foundation
import UIKit

enum AUITransformHandler {
    
    static func applyTransform(for viewEnum: AUIViewEnumeration, transform: AUITransformParams, viewController: AUIViewController? = nil) {
        let baseView = viewEnum.view
        
        switch transform {
        case .hide(let value):
            baseView.isHidden = true
        case .color(let value):
            baseView.backgroundColor = UIColor(hex: value)
        case .alpha(let value):
            baseView.alpha = value
        case .userIntraction(let value):
            baseView.isUserInteractionEnabled = value
        case .cornerRadius(let value):
            baseView.layer.cornerRadius = value
            baseView.clipsToBounds = true
        case .isOn(let value):
            guard let uiSwitch = baseView as? UISwitch else { return }
            uiSwitch.isOn = value
        case .text(let value):
            guard let textLabel = baseView as? UILabel else { return }
            textLabel.text = value
        case .textAligment(let value):
            guard let textLabel = baseView as? UILabel else { return }
            textLabel.textAlignment = value.uiAligment
        case .placeholder(let value):
            guard let textField = baseView as? UITextField else { return }
            textField.placeholder = value
        case .editable(let value):
            guard let textField = baseView as? UITextField else { return }
            textField.isUserInteractionEnabled = value
        case .image(let value):
            guard let imageView = baseView as? UIImageView else { return }
            imageView.image = UIImage(named: value)
        case .imageContentMode(let value):
            guard let imageView = baseView as? UIImageView else { return }
            imageView.contentMode = value.uiKit
        case .progress(let value):
            guard let imageView = baseView as? UIProgressView else { return }
            imageView.progress = Float(value)
        case .tableViewReload(let value):
            guard let tableViewHandler = viewController?.tableViewHandler else { return }
            
            tableViewHandler.reload(data: value)
        }
        
    }
}
