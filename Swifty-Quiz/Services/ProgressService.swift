//
//  ProgressService.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit

class ProgressService {
    
    private let records = Game.shared.getRecordsList()
    
    func getProgressBackground(for topic: String) -> UIColor {
        
        let grades = [0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5]
        
        let color = UIColor(named: "MainYellow") ?? .yellow
        
        return color.withAlphaComponent(grades.shuffled().first ?? 0.0)
    }
}
