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
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var swipeRightLabel: UILabel!
    @IBOutlet private weak var swipeLeftLabel: UILabel!
    
    var url = URL(string: "")
    private var position = 0
    private let links: [URL?] = [
        URL(
           string: "https://developer.apple.com/documentation/swiftui/path/addroundedrect(in:cornersize:style:transform:)"
        ),
        URL(
           string: "https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui"
        ),
        URL(
           string: "https://developer.apple.com/documentation/swiftui/path/addlines(_:)"
        ),
        URL(
           string: "https://developer.apple.com/documentation/swiftui/path/addlines(_:)"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupSwipeGestures()
        setupPageControl()
        setupSwipeLabels()
    }
    
    private func setupWebView() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        guard let url = links[position] else {
            return
        }
        
        webView.load(
            NSURLRequest(
                url: url
            ) as URLRequest
        )
    }
    
    private func setupSwipeGestures() {
        let swipeLeft = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleGesture)
        )
        
        swipeLeft.direction = .left
        self.view!.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleGesture)
        )
        
        swipeRight.direction = .right
        self.view!.addGestureRecognizer(swipeRight)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = links.count
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc func handleGesture(
        gesture: UISwipeGestureRecognizer
    ) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            if position < links.count - 1 {
                position = position + 1
                pageControl.currentPage = position
                setupWebView()
            }
        }
        else if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            if position > 0 {
                position = position - 1
                pageControl.currentPage = position
                setupWebView()
            }
        }
        
        setupSwipeLabels()
    }
    
    private func setupSwipeLabels() {
        UIView.animate(
            withDuration: 0.25
        ) {
            if self.position == 0 {
                self.swipeLeftLabel.isHidden = true
            } else if self.position + 1 == self.links.count {
                self.swipeLeftLabel.isHidden = false
                self.swipeRightLabel.isHidden = true
            } else if self.position > 0 {
                self.swipeLeftLabel.isHidden = false
                self.swipeRightLabel.isHidden = false
            }
        }
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
