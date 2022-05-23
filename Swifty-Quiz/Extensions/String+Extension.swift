//
//  String+Extension.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.05.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import UIKit

extension String {
    
    func withBoldText(
        text: String,
        font: UIFont? = nil
    ) -> NSAttributedString {
        
        let _font = font ?? UIFont.systemFont(
            ofSize: 14,
            weight: .regular
        )
        
        let fullString = NSMutableAttributedString(
            string: self,
            attributes: [NSAttributedString.Key.font: _font]
        )
        
        let boldFontAttribute: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(
                ofSize: _font.pointSize
            )
        ]
        
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
}
