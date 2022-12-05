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
        sandbox()
    }

    override func viewDidAppear(_ animated: Bool) {
        let vc = SceneBuilder.parse(configuration: ViewControllerPreview.configuration)
        present(vc, animated: true)
        print("\n------------------------------------------------------------\n")
        print(String(data: try! JSONEncoder().encode(ViewControllerPreview.configuration), encoding: .utf8))
    }

    func sandbox() {
        // response()
        print("\n------------------------------------------------------------\n")
        textField()
        print(1)
        DispatchQueue.global().sync {
            print(2)
        }
        print(3)
    }

    func textField() {
        let textField = AUITextField()
        textField.identifier = ""
        textField.placeholder = "Nikita Sosyuk"
        textField.text = {
            let text = AUIText()
            text.content = "1123"
            text.fontSize = 13
            text.fontWeight = .medium
            return text
        }()
        print(String(data: try! JSONEncoder().encode(textField), encoding: .utf8)!)
    }

    func response() {
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

