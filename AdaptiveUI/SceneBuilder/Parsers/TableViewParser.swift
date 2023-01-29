//
//  TableViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 14.12.2022.
//

import UIKit

enum TableViewParser {
    static func configure(
        configuration: AUITableView,
        viewController: AUIViewController
    ) -> UITableView {
        let tableView = UITableView()
        let handler = AUITableViewHandler(config: configuration, viewController: viewController)
        tableView.delegate = handler
        tableView.dataSource = handler
        viewController.tableViewHandler = handler

        return tableView
    }
}
