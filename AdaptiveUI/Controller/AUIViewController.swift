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

    var collectionViewHandler: AUICollectionViewHandler?
    var tableViewHandler: AUITableViewHandler?
    var actionWrappers: [AUIActionWrapper] = []

    // MARK: Private Properties
    
    private let storage: LocalStorageProtocol
    private let processor: AUIViewConfigurationProcessorProtocol

    private var renderLayoutOnce = false
    private var needBuildHierarchy = true
    private var configuration: AUIConfiguration?

    private var blurEffectView: UIVisualEffectView?
    private var activityIndicatorView: UIActivityIndicatorView?

    // MARK: Lifecycle

    public init(
        processor: AUIViewConfigurationProcessorProtocol,
        storage: LocalStorageProtocol = LocalStorage()
    ) {
        self.storage = storage
        self.processor = processor
        super.init(nibName: nil, bundle: nil)
        processor.download { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.storage.loadData(named: self.processor.screenId) { [weak self] configuration in
                    DispatchQueue.main.async {
                        guard let self else { return }
                        guard let configuration else { return self.failedDownloading(with: error) }
                        if self.needBuildHierarchy { self.hideLoadingView() }
                        self.configuration = configuration
                        self.renderLayout(with: configuration)
                    }
                }

            case .success(let configuration):
                self.hideLoadingView()
                self.renderLayout(with: configuration)
                self.configuration = configuration
                if configuration.cache {
                    self.storage.saveData(configuration, named: self.processor.screenId)
                }
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
            DispatchQueue.main.async {
                self.renderLayout(with: configuration)
            }
        } else {
            showLoadingView()
        }
    }

    // MARK: Open Methods

    open func showLoadingView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.alpha = .zero
        blurEffectView.alpha = .zero
        UIView.animate(withDuration: 0.5) {
            self.activityIndicatorView?.alpha = 1
            self.blurEffectView?.alpha = 1
        }
        self.activityIndicatorView = activityIndicatorView
        self.blurEffectView = blurEffectView
    }

    open func hideLoadingView() {
        blurEffectView?.alpha = .zero
        activityIndicatorView?.stopAnimating()
        activityIndicatorView?.isHidden = true
    }

    open func failedDownloading(with error: Error) {
        let alert = UIAlertController(title: "Произошла ошибка при загрузке данных", message: nil ,preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { [weak self] _ in self?.dismiss(animated: true) }
        alert.addAction(action)
        present(alert, animated: true)
    }

    // MARK: Private Methods

    private func renderLayout(with configuration: AUIConfiguration) {
        guard !renderLayoutOnce else { return }
        renderLayoutOnce = true
        let controllerConfiguration = configuration.controller

        let topView: UIView
        switch configuration.controller.kind {
        case .scrollable:
            topView = UIScrollView()
            topView.backgroundColor = .white
            navigationController?.navigationBar.backgroundColor = .white

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
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: pinToSafeArea ? .zero : -view.safeAreaInsets.top
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

        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            SceneBuilder.parse(configuration: configuration, rootView: topView, viewController: self)
        }
    }
}


extension AUIViewController {
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
