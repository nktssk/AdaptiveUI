//
//  SliderParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum SliderParser {
    static func configure(configuration: AUISlider, viewController: AUIViewController) -> UISlider {
        let slider = UISlider()

        slider.value = configuration.currentValue
        slider.minimumValue = configuration.minValue
        slider.maximumValue = configuration.maxValue

        setupImage(from: configuration.minImage, slider: slider, isMin: true)
        setupImage(from: configuration.maxImage, slider: slider, isMin: false)

        let actionWrapper = AUIActionWrapper { [weak viewController, unowned slider] in
            viewController?.sliderValueDidChange(slider)
        }
        viewController.actionWrappers.append(actionWrapper)
        slider.addTarget(actionWrapper, action: #selector(actionWrapper.action), for: .valueChanged)

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .slider(slider)
        }

        BaseViewConfigurator.configure(view: slider, configuration: configuration, viewController: viewController, skipActions: true)

        return slider
    }

    private static func setupImage(from imageConfiguration: AUIImage?, slider: UISlider, isMin: Bool) {
        guard let imageConfiguration = imageConfiguration else { return }

        if let imageURL = imageConfiguration.imageURL, let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                 guard
                     let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                     let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                     let data = data, error == nil,
                     let image = UIImage(data: data)
                     else { return }
                 DispatchQueue.main.async() { [weak slider] in
                     if isMin {
                         slider?.minimumValueImage = image
                     } else {
                         slider?.maximumValueImage = image
                     }
                 }
             }.resume()
        } else {
            if isMin {
                slider.minimumValueImage = UIImage(named: imageConfiguration.imageName ?? "")
            } else {
                slider.maximumValueImage = UIImage(named: imageConfiguration.imageName ?? "")
            }
        }
    }
}


