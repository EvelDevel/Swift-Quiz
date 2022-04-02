//
//  DonationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit
import GoogleMobileAds
import StoreKit

class DonationViewController: UIViewController {

    private struct Constants {
        static let ad = "ca-app-pub-8634387759111764/3661782608"
    }
    
    @IBOutlet private weak var watchAdButton: RoundCornerButton!
    @IBOutlet private weak var dismissButton: RoundCornerButton!
    @IBOutlet private weak var donationView: UIView!
    @IBOutlet private weak var tinkoff: RoundCornerButton!
    
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


// MARK: Main
extension DonationViewController {
    
    private func setup() {
        setAlpha()
        setBlur()
        setShadows()
        requestAd()
    }
    
    private func requestAd() {
        let request = GADRequest()
        GADInterstitialAd.load(
            withAdUnitID: Constants.ad,
            request: request,
            completionHandler: { [self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                interstitial = ad
                interstitial?.fullScreenContentDelegate = self
            }
        )
    }
    
    private func setAlpha() {
        view.alpha = 1
    }
    
    private func setBlur() {
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
    
    private func setShadows() {
        let shadows = Shadow()
        shadows.addHalfButtonShadows([dismissButton])
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
    
    /// Watch Ad button
    @IBAction private func watchAdTapped(_ sender: Any) {
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
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


// MARK: GADFullScreenContentDelegate
extension DonationViewController: GADFullScreenContentDelegate {
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        //interstitial = requestAd()
        print("Ad did dismiss full screen content.")
    }
}


// MARK: Dismissing
extension DonationViewController {
    
    @IBAction private func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         if touch?.view != self.donationView {
            dismissing()
        }
    }
    
    private func dismissing() {
        dismiss(animated: true)
        
        UIView.animate(withDuration: 0.22) {
            self.view.alpha = 0
        }
    }
}
