//
//  UIViewControllerPreview.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 04.12.2022.
//

import UIKit
import SwiftUI

extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {

        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    public var preview: some View {
        return Preview(viewController: self)
    }
}
