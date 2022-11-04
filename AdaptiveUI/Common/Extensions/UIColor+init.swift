//
//  UIColor+AUIColor.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import UIKit

extension UIColor {
    convenience init(from color: AUIColor) {
        self.init() { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor(hex: color.darkThemeColor)
            } else {
                return UIColor(hex: color.lightThemeColor)
            }
        }
    }
}
