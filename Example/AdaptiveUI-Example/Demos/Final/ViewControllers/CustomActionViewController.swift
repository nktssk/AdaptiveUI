//
//  CustomActionViewController.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 27.05.2023.
//

import UIKit
import AdaptiveUI

final class CustomActionViewController: AUIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actions["executeSomeInternalLogic"] = { [weak self] in self?.executeSomeInternalLogic() }
    }
    
    func executeSomeInternalLogic() {
        print("Была вызвана функция \(#function) из файла \(#file)")
    }
}
