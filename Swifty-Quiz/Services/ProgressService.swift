//
//  ProgressService.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import UIKit

final class ProgressService {
    private let records = Game.shared.getRecordsList()
    private let success: Double = 100
    
    struct ProgressValue {
        let progressRate: Int
        let progressColor: CGColor
    }
    
    func getProgress(
        for topic: String
    ) -> ProgressValue {
        let mainColor = UIColor(named: "CustomGreen")?.withAlphaComponent(0.5) ?? .clear
        let records = getTopicRecords(for: topic)
        
        var rate: Int
        var color: CGColor
        
        if isRandom(topic: topic) || records.isEmpty {
            color = UIColor.white.cgColor
            rate = 0
        } else if isSuccess(records: records) {
            color = mainColor.cgColor
            rate = 100
        } else {
            let currentRate = getPercentOfCorrectAnswers(records: records)
            let alpha = (Double(currentRate / records.count) / 100)
            
            if alpha <= 0.3 {
                color = UIColor.white.cgColor
            } else {
                color = mainColor.withAlphaComponent(alpha / 2).cgColor
            }
            
            if currentRate != 0 {
                rate = currentRate / records.count
            } else {
                rate = 0
            }
        }
        
        return ProgressValue(
            progressRate: rate,
            progressColor: color
        )
    }
}


// MARK: - Privates

extension ProgressService {
    private func isRandom(topic: String) -> Bool {
        let topic = CategoriesName(rawValue: topic)
        
        switch topic {
        case .random20, .random50, .random100, .deathMatch:
            return true
        default:
            return false
        }
    }
    
    private func isSuccess(records: [Record]) -> Bool {
        records.first?.percentOfCorrectAnswer == success
    }
    
    private func getPercentOfCorrectAnswers(records: [Record]) -> Int {
        records.reduce(0) { $0 + Int($1.percentOfCorrectAnswer ?? 0) }
    }
    
    private func getTopicRecords(for topic: String) -> [Record] {
        records.filter { $0.topic == topic }
    }
}
