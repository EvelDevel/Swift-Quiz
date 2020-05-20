
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class GameViewShadows {
    
    /// Кнопки - черная тень
    func addButtonShadows(_ buttons: [HalfRoundButton]) {
        for button in buttons {
            button.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            
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
    
    /// Статические элементы - черная тень
    func addStaticShadows(_ questionArea: UIView, _ progressBar: UIView) {
        
        questionArea.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        questionArea.layer.shadowOpacity = 1
        questionArea.layer.shadowRadius = 5
        questionArea.layer.shadowOffset = CGSize(width: 0, height: 5)
        questionArea.layer.position = questionArea.center
        
        progressBar.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        progressBar.layer.shadowOpacity = 1
        progressBar.layer.shadowRadius = 5
        progressBar.layer.shadowOffset = CGSize(width: 0, height: 5)
        progressBar.layer.position = progressBar.center
    }
}
