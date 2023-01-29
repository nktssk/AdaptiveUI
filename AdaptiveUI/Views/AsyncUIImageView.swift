//
//  AsyncUIImageView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

final class AsyncUIImageView: UIImageView {

    var url: String = "" {
        didSet {
            guard let url = URL(string: url) else { return }
            startDownloading(url: url)
        }
    }

    let gradientLayer = CAGradientLayer()

    public override init(image: UIImage? = nil, highlightedImage: UIImage? = nil) {
        super.init(image: image, highlightedImage: highlightedImage)
        tintColor = .systemGray6
    }

    init(url: String) {
        super.init(frame: .zero)

        self.tintColor = .systemGray6
        self.url = url
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func startDownloading(url: URL) {
        DispatchQueue.main.async {
            self.startShimmering()
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
             guard
                 let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                 let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                 let data = data, error == nil,
                 let image = UIImage(data: data)
                 else { return }
             DispatchQueue.main.async() { [weak self] in
                 self?.image = image
                 self?.tintColor = .none
                 self?.gradientLayer.removeAllAnimations()
                 self?.gradientLayer.removeFromSuperlayer()
             }
         }.resume()
    }

    private func startShimmering() {
        self.backgroundColor = .systemGray
        guard let backgroundColor = backgroundColor else { return }

        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = min(bounds.height / 2, 5)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let gradientColorOne = UIColor.systemGray6.withAlphaComponent(0.5).cgColor
        let gradientColorTwo = UIColor.systemGray6.withAlphaComponent(0.8).cgColor
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        layer.addSublayer(gradientLayer)
        gradientLayer.zPosition = CGFloat(Float.greatestFiniteMagnitude)

        // MARK: - Shimmer Animation
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 1.25
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
}
