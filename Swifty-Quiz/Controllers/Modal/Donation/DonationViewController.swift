//
//  DonationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit

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
            withDuration: 0.2,
            animations: ({
                self.view.alpha = 1
            })
        )
    }
}


// MARK: Main
extension DonationViewController {
    
    private func setup() {
        setupViewCornerCurve()
        setupAlpha()
        setupSwipeGestureRecognizer()
        setupAvatar()
    }
    
    private func setupViewCornerCurve() {
        if #available(iOS 13.0, *) {
            donationView.layer.cornerCurve = .continuous
        } else {}
    }
    
    private func setupAlpha() {
        view.alpha = 1
    }
    
    private func setupAvatar() {
        myAvatar.layer.cornerRadius = myAvatar.frame.size.height / 2
    }
    
    /// Tinkoff
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
