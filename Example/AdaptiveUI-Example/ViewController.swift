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

    func sandbox() {
        response()
        print("\n------------------------------------------------------------\n")
        textField()
        print("\n------------------------------------------------------------\n")
        constraints()

    }

    func constraints() {
        let constraint1 = AUIConstraint()
        constraint1.target = "TargetView"
        constraint1.targetAnchor = .width
        constraint1.kind = .relation(source: "SourceView", sourceAnchor: .height, relationType: .equal)
        print(String(data: try! JSONEncoder().encode(constraint1), encoding: .utf8)!)
        let constraint2 = AUIConstraint()
        constraint2.target = "TargetView"
        constraint2.targetAnchor = .height
        constraint2.kind = .constant(value: 200)
        print(String(data: try! JSONEncoder().encode(constraint2), encoding: .utf8)!)
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

