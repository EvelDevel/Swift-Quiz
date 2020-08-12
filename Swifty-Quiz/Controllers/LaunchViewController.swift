
//  Created by Евгений Никитин on 30.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeRightSettingsForSounds()
        controlledTransitionFromLaunch()
    }
    
    /// Меняем аудио-сессию (приложение не останавливает фоновую музыку)
    func makeRightSettingsForSounds() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch {
            print("Some problems with AVAudioSession.sharedInstance())")
        }
    }
    
    /// Контролируемый переход с Лаунч-скрина
    func controlledTransitionFromLaunch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initial = mainStoryboard.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
            initial.modalPresentationStyle = .fullScreen
            self.present(initial, animated: true, completion: nil)
            SoundPlayer.shared.playSound(sound: .theAppIsLoading)
        }
    }
}
