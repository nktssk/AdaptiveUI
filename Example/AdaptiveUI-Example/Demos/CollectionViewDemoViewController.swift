//
//  CollectionViewDemoViewController.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 15.04.2023.
//

import AdaptiveUI

final class CollectionViewDemoViewController: AUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        actions["openRublePayment"] = { [weak self] in self?.openRublePayment() }
        actions["print"] = { print("mvno") }
    }

    func openRublePayment() {
        let viewController = RublePaymentViewController(
            processor: MockAUIViewConfigurationProcessor(
                screenId: "CollectionViewID",
                configurationBuilder: CollectionViewScreenBuilder.self
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
