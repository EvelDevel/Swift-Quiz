
//  Created by Евгений Никитин on 13.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

@IBDesignable
class HalfRoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
