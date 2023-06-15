//
//  TableViewController.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 29.01.2023.
//

import AdaptiveUI

final class TableViewController: AUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        actions["openRublePayment"] = { [weak self] in self?.openRublePayment() }
        actions["print"] = { print("mvno") }
    }

    func openRublePayment() {
        let viewController = RublePaymentViewController(
            processor: MockAUIViewConfigurationProcessor(
                screenId: "TableViewController",
                configurationBuilder: TableConfigurationBuilder.self
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
