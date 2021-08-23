//
//  DonationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController {

    @IBOutlet weak var dismissButton: RoundCornerButton!
    @IBOutlet weak var donationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setBlur()
        setShadows()
    }
    
    private func setView() {
        view.alpha = 1
    }
    
    private func setBlur() {
        let effect = UIBlurEffect(style: .regular)
        let blur = UIVisualEffectView(effect: effect)
        blur.frame = self.view.bounds
        blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blur, at: 0)
    }
    
    private func setShadows() {
        let shadows = ShadowsHelper()
        shadows.addButtonShadows([dismissButton])
    }
}


// MARK: Dismissing
extension DonationViewController {
    
    /// Нажали на кнопку "вернуться в игру"
    @IBAction func backInGameButton(_ sender: UIButton) {
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
