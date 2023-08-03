
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

final class ShadowService {
    private func addShadow(
        to view: UIView,
        color: UIColor,
        opacity: Float,
        radius: CGFloat,
        offset: CGSize
    ) {
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = offset
        view.layer.position = view.center
        view.layer.shouldRasterize = true
        view.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addButtonShadows(
        _ buttons: [UIButton]
    ) {
        for button in buttons {
            addShadow(
                to: button,
                color: UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1),
                opacity: 1,
                radius: 4,
                offset: CGSize(width: 0, height: 5)
            )
        }
    }
    
    func addHalfButtonShadows(
        _ buttons: [UIButton]
    ) {
        for button in buttons {
            addShadow(
                to: button,
                color: UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 0.9),
                opacity: 1,
                radius: 4,
                offset: CGSize(width: 0, height: 3)
            )
        }
    }
    
    func addTopicButtonShadows(
        _ buttons: [UIButton]
    ) {
        for button in buttons {
            addShadow(
                to: button,
                color: UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1),
                opacity: 0.6,
                radius: 4,
                offset: CGSize(width: 0, height: 5)
            )
            
            button.layer.shadowPath = UIBezierPath(
                rect: button.layer.bounds
            ).cgPath
        }
    }
    
    func addRedShadow(
        to button: UIButton
    ) {
        addShadow(
            to: button,
            color: UIColor(red: 0.996, green: 0.353, blue: 0.224, alpha: 0.5),
            opacity: 1,
            radius: 4,
            offset: CGSize(width: 0, height: 5)
        )
    }
    
    func addGreenShadow(
        to button: UIButton
    ) {
        addShadow(
            to: button,
            color: UIColor(red: 0.055, green: 0.8, blue: 0.404, alpha: 0.5),
            opacity: 1,
            radius: 4,
            offset: CGSize(width: 0, height: 5)
        )
    }
    
    func addStaticShadows(
        _ views: [UIView]
    ) {
        for view in views {
            addShadow(
                to: view,
                color: UIColor(red: 0.894, green: 0.902, blue: 0.918, alpha: 1),
                opacity: 1,
                radius: 4,
                offset: CGSize(width: 0, height: 5)
            )
        }
    }
}
