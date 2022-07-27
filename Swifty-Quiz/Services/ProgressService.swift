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
    private let success: Double = 100
    
    /// Get color for each category button
    func getProgressColor(
        for topic: String
    ) -> CGColor {
        var alpha: Double
        var currentTopicRecords: [Record] = []
        let color = UIColor(named: "MainYellow") ?? .yellow
        
        let topic = CategoriesNames(rawValue: topic)
        
        switch topic {
        case .random20, .random50, .random100, .deathMatch:
            return UIColor.white.cgColor
        default:
            break
        }
        
        for record in records {
            if record.topic == topic?.rawValue {
                currentTopicRecords.append(record)
            }
        }
        
        if currentTopicRecords.isEmpty {
            return UIColor.white.cgColor
        } else {
            var succsessRate = 0
            
            if currentTopicRecords.first?.percentOfCorrectAnswer == success {
                return color.withAlphaComponent(1).cgColor
            } else {
                for record in currentTopicRecords {
                    succsessRate += Int(record.percentOfCorrectAnswer ?? 0)
                }
            }
        
            alpha = (Double(succsessRate / currentTopicRecords.count) / 100)
            
            if alpha <= 0.15 {
                return UIColor.white.cgColor
            }
            
            return color.withAlphaComponent(alpha).cgColor
        }
    }
    
    /// Get percent of success for each category button
    func getProgressCounter(
        for topic: String
    ) -> Int {
        var currentTopicRecords: [Record] = []
        var succsessRate = 0
        
        let topic = CategoriesNames(rawValue: topic)
        
        switch topic {
        case .random20, .random50, .random100, .deathMatch:
            return 0
        default:
            break
        }
        
        for record in records {
            if record.topic == topic?.rawValue {
                currentTopicRecords.append(record)
            }
        }
        
        if currentTopicRecords.first?.percentOfCorrectAnswer == success {
            return 100
        } else {
            for record in currentTopicRecords {
                succsessRate += Int(record.percentOfCorrectAnswer ?? 0)
            }
        }
        
        if succsessRate != 0 {
            return succsessRate / currentTopicRecords.count
        } else {
            return 0
        }
    }
}
