
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class ShadowsHelper {
    
    /// Основные кнопки - черная тень
    func addButtonShadows(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.shadowColor = UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 4
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            
            /// Задротское скругление
			if #available(iOS 13.0, *) {
				button.layer.cornerCurve = .continuous
			} else {
				// Fallback on earlier versions
			}
        }
    }
    
    /// Кнопки выбора тем - черная тень
    /// shadowPath - дополнительная оптимизация для большого количества теней
    func addTopicButtonShadows(_ buttons: [UIButton]) {
        for button in buttons {
            button.layer.shadowColor = UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1).cgColor
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 4
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            button.layer.shouldRasterize = true
            button.layer.rasterizationScale = UIScreen.main.scale
            
            /// Maybe it's overkill but it work, so...
            button.layer.shadowPath = UIBezierPath(rect: button.layer.bounds).cgPath
            
            /// Задротское скругление
			if #available(iOS 13.0, *) {
				button.layer.cornerCurve = .continuous
			} else {
				// Fallback on earlier versions
			}
        }
    }
    
    /// Кнопки ответов - красная тень
    func addRedShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.996, green: 0.353, blue: 0.224, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
    
    /// Кнопки ответов - зеленая тень
    func addGreenShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.055, green: 0.8, blue: 0.404, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
    
    /// Черная тень для UIView
    func addStaticShadows(_ view: [UIView]) {
        for view in view {
            view.layer.shadowColor = UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1).cgColor
            view.layer.shadowOpacity = 1
            view.layer.shadowRadius = 4
            view.layer.shadowOffset = CGSize(width: 0, height: 5)
            view.layer.position = view.center
            view.layer.shouldRasterize = true
            view.layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    /// Тени для блока с подсказкой и кнопки "Вернуться"
    func addHelpShadows(button: UIButton, view: UIView) {
        view.layer.shadowColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.position = view.center
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
        
        button.layer.shadowColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = view.center
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
    }
}
