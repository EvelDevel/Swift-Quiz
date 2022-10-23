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
    
    var links: [URL]? = []
    private var position = 0
    
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
        
        guard let links = links else {
            return
        }
        
        let url = links[position]
        
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
        guard let links = links else {
            return
        }
        
        pageControl.numberOfPages = links.count
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc func handleGesture(
        gesture: UISwipeGestureRecognizer
    ) -> Void {
        guard let links = links else {
            return
        }
        
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
            guard let links = self.links else {
                return
            }
            
            if links.count == 1 {
                self.swipeLeftLabel.isHidden = true
                self.swipeRightLabel.isHidden = true
            } else if self.position == 0 {
                self.swipeLeftLabel.isHidden = true
            } else if self.position + 1 == links.count {
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
