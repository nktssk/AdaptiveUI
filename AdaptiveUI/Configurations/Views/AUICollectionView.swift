//
//  AUICollectionView.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 15.04.2023.
//

import UIKit

public final class AUICollectionView: AUIView {
    
    public struct Layout: Serializable {
        
        @Convertible(default: .zero)
        public var minimumLineSpacing: CGFloat

        @Convertible(default: .zero)
        public var minimumInteritemSpacing: CGFloat

        @Convertible(default: .zero)
        public var itemSize: CGSize

        @Convertible(default: .zero)
        public var estimatedItemSize: CGSize

        @Convertible(default: .vertical)
        public var scrollDirection: UICollectionView.ScrollDirection
        
        public init() {}
    }

    @Convertible
    public var cellsTypes: [String: AUIViewCell]

    @Convertible
    public var data: [CellData]
    
    @Convertible
    public var layout: Layout
}
