//
//  ViewController.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 09.10.2022.
//

import UIKit
@testable import AdaptiveUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let response = AUIConfiguration()
        response.controller = {
            let controller = AUIController()
            controller.backgroundColor = .defaultTextColor
            controller.largeTitle = true
            controller.pinToSafeArea = false
            controller.title = "Тестовый экран"
            controller.kind = .scrollable
            return controller
        }()
        response.views = {
            return [
                .view(
                    configuration: {
                        let view = AUIView()
                        view.backgroundColor = .defaultViewColor
                        view.alpha = 0.75
                        view.cornerRadius = 10
                        view.insets = .zero
                        view.accessibilityIdentifier = "Nikita Sosyuk"
                        view.identifier = "identifier"
                        view.size = .zero
                        return view
                    }()
                )
            ]
        }()

        print(String(data: try! JSONEncoder().encode(response), encoding: .utf8)!)
    }
}

