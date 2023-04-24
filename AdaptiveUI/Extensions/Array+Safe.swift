//
//  Array+Safe.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import UIKit

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}

extension Array where Element == UIView {
    func reuse() {
        forEach {
            //$0.isHidden = true
            $0.removeFromSuperview()
        }
    }
}
