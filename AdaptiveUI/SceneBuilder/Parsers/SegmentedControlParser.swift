//
//  SegmentedControlParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum SegmentedControlParser {
    static func configure(configuration: AUISegmentedControl) -> UISegmentedControl {
        let segmentedControl: UISegmentedControl
        switch configuration.items {
        case .titles(let list):
            segmentedControl = UISegmentedControl(items: list)

        case .images(let list):
            segmentedControl = UISegmentedControl(
                items: list.compactMap { image -> UIImage? in
                    guard let imageName = image.imageName else { return nil }
                    return UIImage(named: imageName) ?? UIImage()
                }
            )
        }
        segmentedControl.selectedSegmentIndex = configuration.selectedSegmentIndex

        BaseViewConfigurator.configure(view: segmentedControl, configuration: configuration)

        return segmentedControl
    }
}
