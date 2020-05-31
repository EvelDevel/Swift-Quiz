
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class ShadowsHelper {
    
    /// Кнопки - черная тень
    func addButtonShadows(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.shadowColor = UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            
            /// Задротское скругление
            button.layer.cornerCurve = .continuous
        }
    }
    
    /// Кнопки - красная тень
    func addRedShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.996, green: 0.353, blue: 0.224, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
    
    /// Кнопки - зеленая тень
    func addGreenShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.055, green: 0.8, blue: 0.404, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center

    }
    
    /// Черная тень для UIView
    func addStaticShadows(_ view: [UIView]) {
        for view in view {
            view.layer.shadowColor = UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1).cgColor
            view.layer.shadowOpacity = 1
            view.layer.shadowRadius = 5
            view.layer.shadowOffset = CGSize(width: 0, height: 5)
            view.layer.position = view.center
            view.layer.shouldRasterize = true
            view.layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
