//
//  ViewController.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 09.10.2022.
//

import UIKit
import AdaptiveUI

public let measureGlobal = ScreenMeasure.shared

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openTableScreen(_ sender: Any) {
        let viewController = TableViewController(
            processor: MockAUIViewConfigurationProcessor(
                screenId: "TableConfigurationBuilder3",
                configurationBuilder: TableConfigurationBuilder.self
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }

    @IBAction func openPaymentScreen(_ sender: Any) {
        let viewController = RublePaymentViewController(
            processor: MockAUIViewConfigurationProcessor(
                screenId: "RublePaymentConfigurationBuilder3",
                configurationBuilder: RublePaymentConfigurationBuilder.self
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func openCollectionScreen(_ sender: Any) {
        let viewController = CollectionViewDemoViewController(
            processor: MockAUIViewConfigurationProcessor(
                screenId: "CollectionViewScreenBuilder",
                configurationBuilder: CollectionViewScreenBuilder.self
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func openCodePaymentScreen(_ sender: Any) {
        let viewController = RublePaymentNativeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func openCodeList(_ sender: Any) {
        let viewController = ListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func openNativePaymentScreen(_ sender: Any) {
        let viewController = storyboard!.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
