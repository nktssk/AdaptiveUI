//
//  RublePaymentNative.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 01.05.2023.
//

import UIKit
@testable import AdaptiveUI

final class TargetView: UIView {
    
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        layer.cornerRadius = 20
        titleLabel.textColor = UIColor(hex: "#979797")
        valueLabel.textColor = UIColor(hex: "#FFFFFF")
        titleLabel.font = .systemFont(ofSize: 15, weight: .medium)
        valueLabel.font = .systemFont(ofSize: 35, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class RublePaymentNativeViewController: UIViewController {
    
    let sourceView = TargetView()
    let targetView = TargetView()
    let input = UITextField()
    let lineView = UIView()
    let text = UILabel()
    let button = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        view.addSubview(targetView)
        view.addSubview(sourceView)
        view.addSubview(input)
        view.addSubview(lineView)
        view.addSubview(text)
        view.addSubview(button)
        view.backgroundColor = .white
        
        targetView.translatesAutoresizingMaskIntoConstraints = false
        sourceView.translatesAutoresizingMaskIntoConstraints = false
        input.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        targetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        targetView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        sourceView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 20).isActive = true
        sourceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        sourceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        sourceView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        input.topAnchor.constraint(equalTo: sourceView.bottomAnchor, constant: 20).isActive = true
        input.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        input.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        lineView.topAnchor.constraint(equalTo: input.bottomAnchor, constant: 5).isActive = true
        lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        text.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 5).isActive = true
        text.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    
        button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        targetView.titleLabel.text = "Со счета *5042"
        targetView.valueLabel.text = "134 245,95 $"
        targetView.backgroundColor = UIColor(hex: "#555E73")
        
        sourceView.titleLabel.text = "Накопительный счета *2228"
        sourceView.valueLabel.text = "134 245,95 ?"
        sourceView.backgroundColor = UIColor(hex: "#454545")
        
        text.numberOfLines = .zero
        text.text = "Размер комиссии будет уточнен после ввода реквизитов платежа"
        text.font = .systemFont(ofSize: 14)
        
        lineView.backgroundColor = UIColor(hex: "#A2A1AA")
        input.placeholder = "Сумма от 0,01 $ до 20 000 $"
        button.backgroundColor = UIColor(hex: "#FADE55")
        button.layer.cornerRadius = 20
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        title = "Перевод между счетами"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
