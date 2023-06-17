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
        
        if #available(iOS 13, *) {
            guard let color = scanner.scanInt32(representation: .hexadecimal) else { self.init(); return }
            let mask = 255
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let red = CGFloat(r) / CGFloat(mask)
            let green = CGFloat(g) / CGFloat(mask)
            let blue = CGFloat(b) / CGFloat(mask)
            self.init(red: red, green: green, blue: blue, alpha: 1.0)
            
        } else {
            var int = UInt32()
            
            Scanner(string: hex).scanHexInt32(&int)
            let a, r, g, b: UInt32
            switch hex.count {
            case 3:     (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)  // RGB (12-bit)
            case 6:     (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                    // RGB (24-bit)
            case 8:     (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)       // ARGB (32-bit)
            default:    (a, r, g, b) = (255, 0, 0, 0)
            }
            
            self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
        }
    }
}
