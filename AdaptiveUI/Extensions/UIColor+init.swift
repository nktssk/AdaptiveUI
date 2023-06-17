//
//  UIColor+AUIColor.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import UIKit

extension UIColor {
    convenience init?(from color: AUIColor?) {
        guard let color = color else { return nil }

        guard #available(iOS 13, *) else { self.init(hex: color.lightThemeColor); return }

        self.init() { (UITraitCollection: UITraitCollection) -> UIColor in
            guard UITraitCollection.userInterfaceStyle == .dark else { return UIColor(hex: color.lightThemeColor) }
            return UIColor(hex: color.darkThemeColor)
        }
    }
}
