//
//  AttributedString.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 28.05.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import UIKit

class BoldTextService {
    
    func createBoldTextAnswer(
        _ text: String,
        fontSize: CGFloat
    ) -> NSMutableAttributedString {
        
        let theString = text as NSString
        let theAttributedString = NSMutableAttributedString(
            string: theString as String
        )
        
        let boldString = text.components(separatedBy: ".").first ?? ""
        let boldRange = theString.range(of: boldString)
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        
        theAttributedString.addAttribute(
            NSAttributedString.Key.font,
            value: font,
            range: boldRange
        )
        
        return theAttributedString
    }
}
