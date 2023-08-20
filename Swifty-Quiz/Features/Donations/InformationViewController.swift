//
//  InformationViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.08.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet private weak var dismissButton: RoundCornerButton!
    @IBOutlet private weak var copyNumButton: RoundCornerButton!
    @IBOutlet private weak var separatorHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupSeparator()
    }
    
    private func setupSeparator() {
        separatorHeightConstraint.constant = 1 / UIScreen.main.scale
    }
}

// MARK: - Actions

extension InformationViewController {
    @IBAction func copyNumTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        UIPasteboard.general.string = "89509996972"
        
        UIView.transition(
            with: copyNumButton,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.copyNumButton.setTitle(
                    "Номер скопирован",
                    for: .normal
                )
                self.copyNumButton.setTitleColor(
                    .black,
                    for: .normal
                )
            },
            completion: nil
        )
    }
    
    @IBAction private func backToTopicsButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        dismissView()
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
