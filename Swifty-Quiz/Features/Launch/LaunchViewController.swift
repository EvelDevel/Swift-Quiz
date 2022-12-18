
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

    private func setAudioSettings() {
        do {
            /// Set audio session, app won't stop phone music
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch {}
    }
    
    private func transitionFromLaunch() {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.5
        ) {
            let main: UIStoryboard = UIStoryboard(
                name: "Main",
                bundle: nil
            )
            
            let initial = main.instantiateViewController(
                withIdentifier: "InitialViewController"
            ) as! InitialViewController
            
            initial.modalPresentationStyle = .overFullScreen
            
            self.present(
                initial,
                animated: true,
                completion: nil
            )
        }
    }
}
