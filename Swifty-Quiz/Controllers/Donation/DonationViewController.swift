//
//  DonationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// MARK: Dismissing
extension DonationViewController {
    
    /// Нажали на кнопку "вернуться в игру"
    @IBAction func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
    
    private func dismissing() {
        dismiss(animated: true)
    }
}
