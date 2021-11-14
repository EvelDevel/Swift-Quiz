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
    
    /// Get color for each category button
    func getProgressColor(for topic: String) -> CGColor {
        var alpha: Double
        var currentTopicRecords: [Record] = []
        let color = UIColor(named: "MainYellow") ?? .yellow
        
        for record in records {
            if record.topic == topic {
                currentTopicRecords.append(record)
            }
        }
        
        if topic == "20 случайных вопросов" ||
            topic == "50 случайных вопросов" ||
            topic == "100 случайных вопросов" ||
            topic == "The Death Match" {
            return UIColor.white.cgColor
        }
        
        if currentTopicRecords.isEmpty {
            return UIColor.white.cgColor
        } else {
            let recordCounter = currentTopicRecords.count
            var succsessRate = 0
            
            for record in currentTopicRecords {
                succsessRate += Int(record.percentOfCorrectAnswer ?? 0)
            }
            alpha = (Double(succsessRate / recordCounter) / 100)
            // print("alpha \(alpha) for topic \(topic) (success rate: \(succsessRate / recordCounter))")
            
            if alpha <= 0.15 {
                alpha = 0.15
            }
            
            return color.withAlphaComponent(alpha).cgColor
        }
    }
    
    /// Get percent of success for each category button
    func getProgressCounter(for topic: String) -> Int {
        var currentTopicRecords: [Record] = []
        var succsessRate = 0
        
        if topic == "20 случайных вопросов" ||
            topic == "50 случайных вопросов" ||
            topic == "100 случайных вопросов" ||
            topic == "The Death Match" {
            return 0
        }
        
        for record in records {
            if record.topic == topic {
                currentTopicRecords.append(record)
            }
        }
        
        let recordCounter = currentTopicRecords.count
        
        for record in currentTopicRecords {
            succsessRate += Int(record.percentOfCorrectAnswer ?? 0)
        }
        
        if succsessRate != 0 {
            return succsessRate / recordCounter
        } else {
            return 0
        }
    }
}
