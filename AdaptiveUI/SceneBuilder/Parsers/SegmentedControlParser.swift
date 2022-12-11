//
//  SegmentedControlParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum SegmentedControlParser {
    static func configure(configuration: AUISegmentedControl, viewController: AUIViewController) -> UISegmentedControl {
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
        let actionWrapper = AUIActionWrapper { [weak viewController, unowned segmentedControl] in
            viewController?.segmentedControlValueDidChange(segmentedControl)
        }
        viewController.actionWrappers.append(actionWrapper)
        segmentedControl.addTarget(actionWrapper, action: #selector(actionWrapper.action), for: .valueChanged)

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .segmentedControl(segmentedControl)
        }

        BaseViewConfigurator.configure(view: segmentedControl, configuration: configuration, viewController: viewController, skipActions: true)

        return segmentedControl
    }
}
