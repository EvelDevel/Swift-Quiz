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
        default:
            url = ""
        }
        
        return URL(string: url)
    }
}
