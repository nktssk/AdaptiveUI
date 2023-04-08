//
//  AUITableViewHandler.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import UIKit

public class AUITableViewHandler: NSObject, UITableViewDataSource, UITableViewDelegate {

    private var config: AUITableView
    private weak var tableView: UITableView?
    private weak var viewController: AUIViewController?

    init(config: AUITableView, viewController: AUIViewController) {
        self.config = config
        self.viewController = viewController
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView = tableView
        return config.data.count
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

        return SceneBuilder.buildCell(
            data: configuration,
            cellConfiguration: viewConfiguration,
            viewController: viewController
        )
    }
    
    public func reload(data: [AUITableView.Data]) {
        config.data = data
        tableView?.reloadData()
    }
}
