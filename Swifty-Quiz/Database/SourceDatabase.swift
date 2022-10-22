//
//  SourceDatabase.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.10.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class SourceDatabase {
    
    func getSourceUrl(
        questionId: Int
    ) -> URL? {
        var url = ""
        
        switch questionId {
        case 320291560:
            url = "https://stackoverflow.com/questions/25597092/how-to-load-url-in-uiwebview-in-swift"
        default:
            break
        }
        
        return URL(string: url)
    }
}
