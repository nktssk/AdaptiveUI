//
//  CartViewController.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 27.05.2023.
//

import UIKit
import AdaptiveUI

final class CartViewController: UIViewController {
  
    
    @IBAction func openScreen() {
        let viewController = CustomActionViewController(
            processor: DataProcessor(
                screenId: "Payments",
                url: URL(string: "https://ozon-yandex-wb.com/configurations/paymentScreen")!
            )
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
