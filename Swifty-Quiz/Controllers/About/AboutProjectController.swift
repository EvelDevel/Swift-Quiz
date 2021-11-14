
//  Created by Евгений Никитин on 15.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class AboutProjectController: UIViewController {

	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var titleHeight: NSLayoutConstraint!
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			titleHeight.constant = 25
		}
	}
	/// < 13.0 iOS Navigation
	@IBAction func dismissAbout(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .menuMainButton)
		dismiss(animated: true, completion: nil)
	}
}

// MARK: Links
extension AboutProjectController {
    
    @IBAction private func author(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/ev.nikitin")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func design(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/shlehanov")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func corrector(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/id2312583")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func refactorGuru(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://refactoring.guru/ru")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func swiftbookRu(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://swiftbook.ru/content/languageguide/")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func swiftMe(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://swiftme.ru/")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction private func telegramLibrary(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://t.me/mobileproglib")!
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
}
