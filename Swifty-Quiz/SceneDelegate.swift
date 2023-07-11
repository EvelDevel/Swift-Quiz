
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

	@available(iOS 13.0, *)
	func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
		window?.overrideUserInterfaceStyle = .light
        
        guard let _ = (scene as? UIWindowScene) else {
            return
        }
    }
}

