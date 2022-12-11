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
        let viewController = MyAUIViewController(processor: MockAUIViewConfigurationProcessor())
        present(UINavigationController(rootViewController: viewController), animated: true)
    }

    private func printContentVC() {
        guard let data = try? JSONEncoder().encode(ConfigurationBuilder.configuration),
              let string = String(data: data, encoding: .utf8)
        else { return }

        print(string)
    }
}

class MyAUIViewController: AUIViewController {

    private var sumTextField: UITextField? {
        guard case let .textField(textField) = viewHierarchy["SumTextField"] else { return nil }
        return textField
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        actions["SendButtonTapped"] = { [weak self] in self?.sendButtonDidTap() }
    }

    func sendButtonDidTap() {
        guard sumTextField?.text?.isEmpty ?? true else { return showLoadingView() }

        let alert = UIAlertController(title: "Введите сумму", message: "Необходимо ввести сумму перевода", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in alert.dismiss(animated: true) })
        self.present(alert, animated: true)
    }

    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        if string == "" { return true }

        textField.text = text.replacingOccurrences(of: " $", with: "").appending("\(string) $")
        return false
    }
}
