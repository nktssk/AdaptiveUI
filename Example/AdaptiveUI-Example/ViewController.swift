//
//  ViewController.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 09.10.2022.
//

import UIKit
import AdaptiveUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func openTableScreen(_ sender: Any) {
        let viewController = TableViewController(
            processor: MockAUIViewConfigurationProcessor(configurationBuilder: TableConfigurationBuilder.self)
        )
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func openPaymentScreen(_ sender: Any) {
        let viewController = RublePaymentViewController(
            processor: MockAUIViewConfigurationProcessor(configurationBuilder: RublePaymentConfigurationBuilder.self)
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
