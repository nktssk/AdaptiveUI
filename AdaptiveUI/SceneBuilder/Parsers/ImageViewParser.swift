//
//  ImageViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum ImageViewParser {
    static func configure(configuration: AUIImageView, viewController: AUIViewController) -> UIImageView {
        let imageView: UIImageView
        if let url = configuration.image.imageURL {
            imageView = AsyncUIImageView(url: url)
        } else {
            imageView = UIImageView(image: UIImage(named: configuration.image.imageName ?? ""))
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
