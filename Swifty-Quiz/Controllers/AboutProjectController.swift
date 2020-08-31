
//  Created by Евгений Никитин on 15.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class AboutProjectController: UIViewController {

    @IBAction func author(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/ev.nikitin")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func design(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/shlehanov")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func corrector(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://vk.com/id2312583")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func refactorGuru(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://refactoring.guru/ru")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func swiftbookRu(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://swiftbook.ru/content/languageguide/")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func swiftMe(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://swiftme.ru/")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func telegramLibrary(_ sender: Any) {
        let urlComponents = URLComponents(string: "https://t.me/mobileproglib")!
        UIApplication.shared.open(urlComponents.url!)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
