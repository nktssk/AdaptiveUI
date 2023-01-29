//
//  ImageViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum ImageViewParser {
    static func configure(configuration: AUIImageView, viewController: AUIViewController) -> AsyncUIImageView {
        let imageView: AsyncUIImageView
        if let url = configuration.image?.imageURL {
            imageView = AsyncUIImageView(url: url)
        } else if let imageName = configuration.image?.imageName {
            imageView = AsyncUIImageView(image: UIImage(named: imageName))
        } else {
            imageView = AsyncUIImageView()
        }
        imageView.contentMode = configuration.contentMode.uiKit
        imageView.tintColor = UIColor(from: configuration.tintColor)

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .imageView(imageView)
        }

        BaseViewConfigurator.configure(view: imageView, configuration: configuration, viewController: viewController)

        return imageView
    }
}
