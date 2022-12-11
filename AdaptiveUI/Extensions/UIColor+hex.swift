//
//  UIColor+HEX.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import UIKit

extension UIColor {
    public convenience init(hex: String?) {
        guard let hex = hex else { self.init(); return }
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = ["#"]
        guard let color = scanner.scanInt32(representation: .hexadecimal) else { self.init(); return }
        let mask = 255
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red = CGFloat(r) / CGFloat(mask)
        let green = CGFloat(g) / CGFloat(mask)
        let blue = CGFloat(b) / CGFloat(mask)
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
