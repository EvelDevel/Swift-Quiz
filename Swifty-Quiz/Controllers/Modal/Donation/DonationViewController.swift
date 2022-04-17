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
    
    var viewWasDismissed: (() -> Void)?
    
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
        setupAvatar()
    }
    
    private func setupViewCornerCurve() {
        if #available(iOS 13.0, *) {
            donationView.layer.cornerCurve = .continuous
        } else {}
    }
    
    private func setupAvatar() {
        myAvatar.layer.cornerRadius = myAvatar.frame.size.height / 2
    }
    
    @IBAction private func tinkoffTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        let url = URL(
            string: "https://www.tinkoff.ru/collectmoney/crowd/nikitin.evgeniy547/xdyrc84044/?short_link=2PG5freJRUM&httpMethod=GET")
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func shareAppTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        let firstActivityItem = "Поделитесь приложением Свифти-Квиз"
        let secondActivityItem = URL(string: "https://inlnk.ru/84jzoG")!
        
        let activityViewController = UIActivityViewController(
            activityItems: [
                firstActivityItem,
                secondActivityItem
            ],
            applicationActivities: nil
        )
        
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
        
        activityViewController.popoverPresentationController?.sourceRect = CGRect(
            x: 150,
            y: 150,
            width: 0,
            height: 0
        )
        
        if #available(iOS 13.0, *) {
            activityViewController.activityItemsConfiguration = [
                UIActivity.ActivityType.message
            ] as? UIActivityItemsConfigurationReading
        }
        
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.postToFacebook
        ]
        
        if #available(iOS 13.0, *) {
            activityViewController.isModalInPresentation = true
        }
        
        self.present(
            activityViewController,
            animated: true,
            completion: nil
        )
    }
}


// MARK: Dismissing
extension DonationViewController {
    
    @IBAction private func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
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
        viewWasDismissed?()
    }
}
