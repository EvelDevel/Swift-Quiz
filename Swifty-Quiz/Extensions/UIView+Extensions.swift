//
//  UIView+Extensions.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 09.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

extension UIView {
    func animateLabelChanges(
        _ text: String,
        duration: TimeInterval = 0.2
    ) {
        UIView.transition(
            with: self,
            duration: duration,
            options: .transitionCrossDissolve,
            animations: {
                if let label = self as? UILabel {
                    label.text = text
                }
            },
            completion: nil
        )
    }
}
