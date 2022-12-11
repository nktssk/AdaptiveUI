//
//  AUIViewController.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit
import WebKit

open class AUIViewController: UIViewController {

    // MARK: Private Properties

    private let processor: AUIViewConfigurationProcessorProtocol

    private var needBuildHierarchy = true
    private var configuration: AUIConfiguration?
    private var actions: [String: VoidClosure] = [:]

    init(processor: AUIViewConfigurationProcessorProtocol) {
        self.processor = processor
        super.init(nibName: nil, bundle: nil)

        processor.download { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.failedDownloading(with: error)

            case .success(let configuration):
                if self.needBuildHierarchy {
                    self.hideLoadingView()
                }
                self.configuration = configuration
            }
        }
    }


    open override func viewDidLoad() {
        super.viewDidLoad()
        if let configuration = configuration {
            needBuildHierarchy = false
            renderLayout(with: configuration)
        } else {
            showLoadingView()
        }
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Open Methods

    open func showLoadingView() {}
    open func hideLoadingView() {}

    open func failedDownloading(with error: Error) {}

    // MARK: Public Methods

    public func setupActions(actions: [String: VoidClosure]) {
        self.actions = actions
    }

    public func appendAction(identifier: String, action: @escaping VoidClosure) {
        actions[identifier] = action
    }

    // MARK: Private Methods

    private func renderLayout(with configuration: AUIConfiguration) {
        let controllerConfiguration = configuration.controller

        let topView: UIView
        switch configuration.controller.kind {
        case .scrollable:
            topView = UIScrollView()

        case .static:
            topView = UIView()

        case .webView:
            guard let urlString = configuration.controller.webViewURL,
                  let url = URL(string: urlString) else { return topView = UIView() }
            
            let webView = WKWebView()
            webView.load(URLRequest(url: url))
            topView = webView
        }

        view.addSubview(topView)
        title = controllerConfiguration.title
        view.backgroundColor = UIColor(from: controllerConfiguration.backgroundColor)
        navigationController?.navigationBar.isTranslucent = controllerConfiguration.isTranslucent
        navigationController?.navigationBar.prefersLargeTitles = controllerConfiguration.largeTitle

        let pinToSafeArea = controllerConfiguration.pinToSafeArea
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                topView.topAnchor.constraint(
                    equalTo: view.topAnchor,
                    constant: pinToSafeArea ? view.safeAreaInsets.top : .zero
                ),
                topView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: pinToSafeArea ? view.safeAreaInsets.left : .zero
                ),
                topView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: pinToSafeArea ? view.safeAreaInsets.right : .zero
                ),
                topView.bottomAnchor.constraint(
                    equalTo: view.bottomAnchor,
                    constant: pinToSafeArea ? view.safeAreaInsets.bottom : .zero
                )
            ]
        )
        
        SceneBuilder.parse(configuration: configuration, rootView: topView)
    }
}

