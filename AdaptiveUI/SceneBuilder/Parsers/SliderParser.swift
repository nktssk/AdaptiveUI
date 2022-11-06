//
//  SliderParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum SliderParser {
    static func configure(configuration: AUISlider) -> UISlider {
        let slider = UISlider()
        BaseViewConfigurator.configure(view: slider, configuration: configuration)

        slider.value = configuration.currentValue
        slider.minimumValue = configuration.minValue
        slider.maximumValue = configuration.maxValue

        // TODO: Images
        // slider.maximumValueImage

        return slider
    }
}
