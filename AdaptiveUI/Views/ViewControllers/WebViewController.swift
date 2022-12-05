//
//  WebViewController.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 20.11.2022.
//

import WebKit
import UIKit

final class WebViewControllerViewController: UIViewController {

    let url: String?

    init(url: String?) {
        self.url = url
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        guard let urlString = url, let url = URL(string: urlString) else {
            return super.loadView()
        }
        let webView = WKWebView()
        view = webView
        webView.load(URLRequest(url: url))
    }
}
