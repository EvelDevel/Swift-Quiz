
//  Created by Евгений Никитин on 15.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

final class AboutProjectController: UIViewController {
	@IBOutlet private weak var backButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			// titleHeight.constant = 25
		}
	}
	/// < 13.0 iOS Navigation
	@IBAction func dismissAbout(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
		dismiss(animated: true, completion: nil)
	}
}


// MARK: - Links

extension AboutProjectController {
    @IBAction private func vk(_ sender: Any) {
        let urlComponents = URLComponents(
            string: "https://vk.com/ev.nikitin"
        )!
        
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    @IBAction private func tg(_ sender: Any) {
        let urlComponents = URLComponents(
            string: "https://t.me/@Smael1989"
        )!
        
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    @IBAction private func linkedin(_ sender: Any) {
        let urlComponents = URLComponents(
            string: "https://www.linkedin.com/in/evgeny-nikitin-003031103/"
        )!
        
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    @IBAction private func refactorGuru(_ sender: Any) {
        let urlComponents = URLComponents(
            string: "https://refactoring.guru/ru"
        )!
        
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    @IBAction private func swiftbookRu(_ sender: Any) {
        let urlComponents = URLComponents(
            string: "https://swiftbook.ru/content/languageguide/"
        )!
        
        UIApplication.shared.open(urlComponents.url!)
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
}
