//
//  SearchBarParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum SearchBarParser {
    static func configure(configuration: AUISearchBar) -> UISearchBar {
        let searchBar = UISearchBar()

        searchBar.text = configuration.text.content
        searchBar.placeholder = configuration.placeholder
        searchBar.isTranslucent = configuration.isTranslucent
        searchBar.searchTextField.font = configuration.text.uiFont
        searchBar.tintColor = UIColor(from: configuration.tintColor)
        searchBar.barTintColor = UIColor(from: configuration.barTintColor)
        searchBar.searchBarStyle = configuration.searchBarStyle.uiKit

        BaseViewConfigurator.configure(view: searchBar, configuration: configuration)

        return searchBar
    }
}
