
//  Created by Евгений Никитин on 30.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setAudioSettings()
        transitionFromLaunch()
    }
    
    // Set audio session, app won't stop music
    func setAudioSettings() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch {
            print("Some problems with AVAudioSession.sharedInstance())")
        }
    }
    
    func transitionFromLaunch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initial = mainStoryboard.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
            initial.modalPresentationStyle = .overFullScreen
            self.present(initial, animated: true, completion: nil)
            SoundPlayer.shared.playSound(sound: .theAppIsLoading)
        }
    }
}
