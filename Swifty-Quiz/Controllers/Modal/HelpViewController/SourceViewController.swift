//
//  SourceViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.10.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import UIKit
import WebKit

class SourceViewController: UIViewController {
    @IBOutlet weak var dismissButton: RoundCornerButton!
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    var url = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    private func setupWebView() {
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        guard let url = url else {
            return
        }
        
        webView.load(
            NSURLRequest(
                url: url
            ) as URLRequest
        )
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}


// MARK: WebView delegate
extension SourceViewController: WKNavigationDelegate, WKUIDelegate{
    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
}
