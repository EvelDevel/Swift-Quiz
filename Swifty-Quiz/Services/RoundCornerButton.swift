
//  Created by Евгений Никитин on 01.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

@IBDesignable class RoundCornerButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
            if #available(iOS 13, *) {
                self.layer.cornerCurve = .continuous
            }
        }
    }
}

