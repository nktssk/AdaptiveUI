//
//  CollectionViewParser.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 15.04.2023.
//

import UIKit

enum CollectionViewParser {
    static func configure(
        configuration: AUICollectionView,
        viewController: AUIViewController
    ) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = configuration.layout.scrollDirection
        layout.estimatedItemSize = configuration.layout.estimatedItemSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StubCell.self, forCellWithReuseIdentifier: "stub")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "base")
        
        let handler = AUICollectionViewHandler(config: configuration, viewController: viewController)
        collectionView.delegate = handler
        collectionView.dataSource = handler
        viewController.collectionViewHandler = handler

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .collectionView(collectionView)
        }

        return collectionView
    }
}
