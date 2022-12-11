//
//  AUIViewController.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit
import WebKit

open class AUIViewController: UIViewController {

    // MARK: Open Properties

    open var actions: [String: VoidClosure] = [:]
    open var viewHierarchy: [String: AUIViewEnumeration] = [:]

    // MARK: Internal Properties

    var actionWrappers: [AUIActionWrapper] = []

    // MARK: Private Properties
    
    private let processor: AUIViewConfigurationProcessorProtocol

    private var needBuildHierarchy = true
    private var configuration: AUIConfiguration?

    private lazy var blurEffectView = UIVisualEffectView()
    private lazy var activityIndicatorView = UIActivityIndicatorView()

    // MARK: Lifecycle

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

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    // MARK: Open Methods

    open func showLoadingView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.alpha = .zero
        blurEffectView.alpha = .zero
        UIView.animate(withDuration: 0.5) {
            self.activityIndicatorView.alpha = 1
            self.blurEffectView.alpha = 1
        }
    }

    open func hideLoadingView() {
        blurEffectView.alpha = .zero
        activityIndicatorView.stopAnimating()
        activityIndicatorView.alpha = .zero
    }

    open func failedDownloading(with error: Error) {}

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
        
        SceneBuilder.parse(configuration: configuration, rootView: topView, viewController: self)
    }
}


extension AUIViewController {

    // MARK: Actions

    @objc func switchValueDidChange(_ switch: UISwitch) {}
    @objc open func sliderValueDidChange(_ slider: UISlider) {}
    @objc func segmentedControlValueDidChange(_ segmentedControl: UISegmentedControl) {}
}

extension AUIViewController: UITextViewDelegate {

    @objc open func textViewShouldEndEditing(_ textView: UITextView) -> Bool { true }
    @objc open func textViewShouldBeginEditing(_ textView: UITextView) -> Bool { true }
    @objc open func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool { true }

    @objc open func textViewDidChange(_ textView: UITextView) {}
    @objc open func textViewDidEndEditing(_ textView: UITextView) {}
    @objc open func textViewDidBeginEditing(_ textView: UITextView) {}
}

extension AUIViewController: UITextFieldDelegate {

    @objc open func textFieldShouldClear(_ textField: UITextField) -> Bool { true }
    @objc open func textFieldShouldReturn(_ textField: UITextField) -> Bool { true }
    @objc open func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { true }
    @objc open func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool { true }

    @objc open func textFieldDidEndEditing(_ textField: UITextField) {}
    @objc open func textFieldDidBeginEditing(_ textField: UITextField) {}
    @objc open func textFieldDidChangeSelection(_ textField: UITextField) {}
    @objc open func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {}
    @objc open func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool { true }
}

extension AUIViewController: UISearchBarDelegate {}
