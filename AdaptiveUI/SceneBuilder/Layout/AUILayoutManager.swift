//
//  AUILayoutManager.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 20.11.2022.
//

import UIKit

enum AUILayoutManager {

    static func layout(hierarchy: ViewHierarchy, constraints: [AUIConstraint]) {
        let nsConstraints: [NSLayoutConstraint] = constraints.compactMap { constraint -> NSLayoutConstraint? in
            guard let view = hierarchy[constraint.target] else {
                assertionFailure("Can not find needed view")
                return nil
            }

            switch constraint.kind {
            case .constant(let constant):
                return setupConstantLayout(view: view, constant: constant, anchor: constraint.targetAnchor)
            case .relation(let configuration):
                let sourceView: UIView
                if configuration.source == "AUIParentView", let superview = view.superview {
                    sourceView = superview
                } else if let hierarchySourceView = hierarchy[configuration.source] {
                    sourceView = hierarchySourceView
                } else {
                    assertionFailure("Can not find needed view")
                    return nil
                }

                return setupRelationLayout(
                    target: view,
                    source: sourceView,
                    targetAnchor: constraint.targetAnchor,
                    configuration: configuration
                )
            }
        }
        NSLayoutConstraint.activate(nsConstraints)
    }

    private static func setupRelationLayout(
        target: UIView,
        source: UIView,
        targetAnchor: AUIConstraint.Anchor,
        configuration: AUIConstraint.RelationConfiguration
    ) -> NSLayoutConstraint? {
        var constraint: NSLayoutConstraint? = nil
        if (target.superview as? UITableViewCell) == nil {
            target.translatesAutoresizingMaskIntoConstraints = false
        }
        if (source.superview as? UITableViewCell) == nil {
            source.translatesAutoresizingMaskIntoConstraints = false
        }

        // Size
        if let targetAnchor = targetAnchor.dimensionAnchorFor(target),
           let sourceAnchor = configuration.sourceAnchor.dimensionAnchorFor(source) {
            switch configuration.relationType {
            case .equal:
                if configuration.multiplier != .zero {
                    constraint = targetAnchor.constraint(
                        equalTo: sourceAnchor,
                        multiplier: configuration.multiplier
                    )
                } else {
                    constraint = targetAnchor.constraint(
                        equalTo: sourceAnchor,
                        constant: configuration.constant
                    )
                }
            case .greaterThanOrEqual:
                constraint = targetAnchor.constraint(
                    greaterThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            case .lessThanOrEqual:
                constraint = targetAnchor.constraint(
                    lessThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            }
        }

        // X Axis
        if let targetAnchor = targetAnchor.xAxisAnchorFor(target),
           let sourceAnchor = configuration.sourceAnchor.xAxisAnchorFor(source) {
            switch configuration.relationType {
            case .equal:
                constraint = targetAnchor.constraint(
                    equalTo: sourceAnchor,
                    constant: configuration.constant
                )
            case .greaterThanOrEqual:
                constraint = targetAnchor.constraint(
                    greaterThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            case .lessThanOrEqual:
                constraint = targetAnchor.constraint(
                    lessThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            }
        }

        // Y Axis
        if let targetAnchor = targetAnchor.yAxisAnchorFor(target),
           let sourceAnchor = configuration.sourceAnchor.yAxisAnchorFor(source) {
            switch configuration.relationType {
            case .equal:
                constraint = targetAnchor.constraint(
                    equalTo: sourceAnchor,
                    constant: configuration.constant
                )
            case .greaterThanOrEqual:
                constraint = targetAnchor.constraint(
                    greaterThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            case .lessThanOrEqual:
                constraint = targetAnchor.constraint(
                    lessThanOrEqualTo: sourceAnchor,
                    constant: configuration.constant
                )
            }
        }
        constraint?.priority = .init(rawValue: configuration.priority)

        return constraint
    }

    private static func setupConstantLayout(view: UIView, constant: Double, anchor: AUIConstraint.Anchor) -> NSLayoutConstraint? {
        let cgConstant = CGFloat(constant)
        view.translatesAutoresizingMaskIntoConstraints = false
        switch anchor {
        case .width:
            return view.widthAnchor.constraint(equalToConstant: cgConstant)
        case .height:
            return view.heightAnchor.constraint(equalToConstant: cgConstant)
        case .top, .bottom, .leading, .trailing, .centerX, .centerY:
            assertionFailure("Can not be layout constant for this anchors")
            return nil
        }
    }
}
