
//  Created by Евгений Никитин on 30.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

final class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setAudioSettings()
        transitionFromLaunch()
    }

    private func setAudioSettings() {
        do {
            /// Set audio session, app won't stop phone music
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.ambient
            )
        } catch {
            print("Failed to set audio category: \(error)")
        }
    }
    
    private func transitionFromLaunch() {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.2
        ) {
            let main: UIStoryboard = UIStoryboard(
                name: Constants.main,
                bundle: nil
            )
            
            let initial = main.instantiateViewController(
                withIdentifier: Constants.initialViewIdentifier
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
