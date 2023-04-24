//
//  AUICollectionViewHandler.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 15.04.2023.
//

import UIKit

public class AUICollectionViewHandler: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var config: AUICollectionView
    private weak var collectionView: UICollectionView?
    private weak var viewController: AUIViewController?

    init(config: AUICollectionView, viewController: AUIViewController) {
        self.config = config
        self.viewController = viewController
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.collectionView = collectionView
        return config.data.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configuration = config.data[safe: indexPath.row]!
        let viewConfiguration = config.cellsTypes[configuration.cellType]!
        let viewController = viewController!
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stub", for: indexPath) as! StubCell
        
        if cell.contentView.constraints.isEmpty {
            NSLayoutConstraint.activate([
                    cell.contentView.widthAnchor.constraint(equalToConstant: config.layout.itemSize.width),
                    cell.contentView.heightAnchor.constraint(equalToConstant: config.layout.itemSize.height)
            ])
        }

        return SceneBuilder.buildCell(
            data: configuration,
            cell: cell,
            config: config.layout,
            cellConfiguration: viewConfiguration,
            viewController: viewController
        )
    }


    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = config.data[safe: indexPath.row] else { return }
        viewController?.actions[data.selectActionId ?? ""]?()
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    public func reload(data: [CellData]) {
        config.data = data
        collectionView?.reloadData()
    }
}

class StubCell: UICollectionViewCell {
    var hierarchy: [String: UIView] = [:]
}
