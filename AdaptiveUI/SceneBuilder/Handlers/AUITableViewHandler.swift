//
//  AUITableViewHandler.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import UIKit

public class AUITableViewHandler: NSObject, UITableViewDataSource, UITableViewDelegate {

    private let config: AUITableView
    private weak var viewController: AUIViewController?

    init(config: AUITableView, viewController: AUIViewController) {
        self.config = config
        self.viewController = viewController
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        config.data.count
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = config.data[safe: indexPath.row] else { return }
        viewController?.actions[data.selectActionId ?? ""]?()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configuration = config.data[safe: indexPath.row],
              let viewConfiguration = config.cellsTypes[configuration.cellType],
              let viewController = viewController
        else { return UITableViewCell() }

        let cell = UITableViewCell()
        var hierarchy = [String: UIView]()
        BaseViewConfigurator.configure(view: cell, configuration: viewConfiguration, viewController: viewController)
        viewConfiguration.subviews.forEach {
            SceneBuilder.buildViewHierarchy(rootView: cell, configuration: $0, hierarchy: &hierarchy, viewController: viewController)
        }
        AUILayoutManager.layout(hierarchy: hierarchy, constraints: viewConfiguration.layout)

        for (identifier, data) in configuration.identifierToData {
            guard let contentView = hierarchy[identifier] else { continue }
            switch data {
            case .image(let imageURL):
                (contentView as? AsyncUIImageView)?.url = imageURL
            case .text(let text):
                (contentView as? UILabel)?.text = text
            }
        }

        return cell
    }
}
