//
//  DonationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit
import StoreKit

class DonationViewController: UIViewController {

    @IBOutlet private weak var dismissButton: RoundCornerButton!
    @IBOutlet private weak var donationView: UIView!
    @IBOutlet private weak var myAvatar: UIImageView!
    @IBOutlet private weak var tinkoff: RoundCornerButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.alpha = 0
        
        UIView.animate(
            withDuration: 0.3,
            animations: ({
                self.view.alpha = 1
            })
        )
    }
}


// MARK: Main
extension DonationViewController {
    
    private func setup() {
        setupAlpha()
        setupBlur()
        setupShadows()
        setupSwipeGestureRecognizer()
        setupAvatar()
    }
    
    private func setupAlpha() {
        view.alpha = 1
    }
    
    private func setupBlur() {
        if #available(iOS 13, *) {
            let effect = UIBlurEffect(style: .regular)
            let blur = UIVisualEffectView(effect: effect)
            blur.frame = self.view.bounds
            blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.insertSubview(blur, at: 0)
        } else {
            view.backgroundColor = #colorLiteral(red: 0.8084501554, green: 0.8112918123, blue: 0.819816783, alpha: 0.8)
        }
    }
    
    private func setupShadows() {
        let shadows = Shadow()
        shadows.addHalfButtonShadows([dismissButton])
    }
    
    private func setupAvatar() {
        myAvatar.layer.cornerRadius = myAvatar.frame.size.height / 2
    }
    
    /// Donates buttons
    @IBAction private func donate99(_ sender: Any) {
        IAPManager.shared.purchase(product: .swiftyQuizDonate99)
    }
    @IBAction private func donate179(_ sender: Any) {
        IAPManager.shared.purchase(product: .swiftyQuizDonate179)
    }
    @IBAction private func donate279(_ sender: Any) {
        IAPManager.shared.purchase(product: .swiftyQuizDonate279)
    }
    @IBAction private func donate379(_ sender: Any) {
        IAPManager.shared.purchase(product: .swiftyQuizDonate379)
    }
    
    /// Donate Tinkoff
    @IBAction private func tinkoffTapped(_ sender: Any) {
        let url = URL(
            string: "https://www.tinkoff.ru/collectmoney/crowd/nikitin.evgeniy547/xdyrc84044/?short_link=2PG5freJRUM&httpMethod=GET")
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
}


// MARK: Dismissing
extension DonationViewController {
    
    @IBAction private func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(
            sound: .menuMainButton
        )
        
        dismissView()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
         let touch = touches.first
         
        if touch?.view != self.donationView {
            dismissView()
        }
    }
    
    private func dismissView() {
        UIView.animate(
            withDuration: 0.3,
            animations: ({
                self.view.alpha = 0
            }),
            completion: ({ _ in
                self.dismiss(animated: false)
            })
        )
    }
}


// MARK: Swipe gesture
extension DonationViewController: UIGestureRecognizerDelegate {
    
    private func setupSwipeGestureRecognizer() {
        let swipeRecognizer = UISwipeGestureRecognizer(
            target: self,
            action: #selector(handleSwipeGesture)
        )
        
        swipeRecognizer.direction = .down
        view.addGestureRecognizer(swipeRecognizer)
    }

    @objc
    private func handleSwipeGesture(
        gesture: UISwipeGestureRecognizer
    ) {
        if gesture.direction == .down {
            dismissView()
        }
    }
}
