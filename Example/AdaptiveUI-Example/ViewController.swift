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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printContentVC()
        let viewController = AUIViewController(processor: MockAUIViewConfigurationProcessor())
        present(UINavigationController(rootViewController: viewController), animated: true)
    }

    private func printContentVC() {
        guard let data = try? JSONEncoder().encode(ConfigurationBuilder.configuration),
              let string = String(data: data, encoding: .utf8)
        else { return }

        print(string)
    }
}
