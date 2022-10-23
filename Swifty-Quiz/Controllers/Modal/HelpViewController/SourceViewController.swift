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
    @IBOutlet private weak var swipeRightButton: UIButton!
    @IBOutlet private weak var swipeLeftButton: UIButton!
    
    var links: [String]? = []
    var id = 0
    private var position = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupPageControl()
        setupSwipeButtons()
    }
    
    private func setupWebView() {
        UIView.animate(
            withDuration: 0.25
        ) {
            self.webView.alpha = 0.2
        }
        
        activityIndicator.startAnimating()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        
        guard let links = links,
              let url = URL(string: links[position]) else {
            showIncorrectUrlAlert()
            return
        }
        
        webView.load(
            NSURLRequest(
                url: url
            ) as URLRequest
        )
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
    
    @IBAction func goRightTapped(_ sender: Any) {
        goToRightTapped()
    }
    
    @IBAction func goLeftTapped(_ sender: Any) {
        goToLeftTapped()
    }
    
    private func goToRightTapped() {
        guard let links = links else {
            return
        }
        
        if position < links.count - 1 {
            position = position + 1
            pageControl.currentPage = position
            setupWebView()
            setupSwipeButtons()
        }
    }
    
    private func goToLeftTapped() {
        if position > 0 {
            position = position - 1
            pageControl.currentPage = position
            setupWebView()
            setupSwipeButtons()
        }
    }
    
    private func setupSwipeButtons() {
        UIView.animate(
            withDuration: 0.25
        ) {
            guard let links = self.links else {
                return
            }
            
            if links.count == 1 {
                self.swipeLeftButton.isHidden = true
                self.swipeRightButton.isHidden = true
            } else if self.position == 0 {
                self.swipeLeftButton.isHidden = true
                self.swipeRightButton.isHidden = false
            } else if self.position + 1 == links.count {
                self.swipeLeftButton.isHidden = false
                self.swipeRightButton.isHidden = true
            } else if self.position > 0 {
                self.swipeLeftButton.isHidden = false
                self.swipeRightButton.isHidden = false
            }
        }
    }
    
    private func showIncorrectUrlAlert() {
        let alert = UIAlertController(
            title: "Упс, кажется эта ссылка кривая",
            message: "Вы можете сообщить на hello@swifty-quiz.ru о проблеме со ссылкой в вопросе №\(id)",
            preferredStyle: UIAlertController.Style.alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Закрыть",
                style: UIAlertAction.Style.default
            )
        )
        
        present(
            alert,
            animated: true
        )
    }
}


// MARK: WebView delegate
extension SourceViewController: WKNavigationDelegate, WKUIDelegate{
    func webView(
        _ webView: WKWebView,
        didFinish navigation: WKNavigation!
    ) {
        self.activityIndicator.stopAnimating()
        
        UIView.animate(
            withDuration: 0.8
        ) {
            self.webView.alpha = 1
        }
    }
}
