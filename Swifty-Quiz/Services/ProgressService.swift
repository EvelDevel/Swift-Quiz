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
    
    func getProgressColor(
        for topic: String
    ) -> CGColor {
        let color = UIColor(named: "MainYellow") ?? .yellow
        let records = appendTopicRecords(for: topic)
        
        if isRandom(topic: topic) || records.isEmpty {
            return UIColor.white.cgColor
        }
        
        if isSuccess(records: records) {
            return color.cgColor
        } else {
            let rate = calculateRate(records: records)
            let alpha = (Double(rate / records.count) / 100)
            
            if alpha <= 0.15 {
                return UIColor.white.cgColor
            } else {
                return color.withAlphaComponent(alpha).cgColor
            }
        }
    }
    
    func getProgressPercent(
        for topic: String
    ) -> Int {
        let records = appendTopicRecords(for: topic)
        
        if isRandom(topic: topic) || records.isEmpty {
            return 0
        }
        
        if isSuccess(records: records) {
            return 100
        } else {
            let rate = calculateRate(records: records)
            
            if rate != 0 {
                return rate / records.count
            } else {
                return 0
            }
        }
    }
}


// MARK: Privates
extension ProgressService {
    private func isRandom(
        topic: String
    ) -> Bool {
        let topic = CategoriesName(rawValue: topic)
        
        switch topic {
        case .random20, .random50, .random100, .deathMatch:
            return true
        default:
            return false
        }
    }
    
    private func isSuccess(
        records: [Record]
    ) -> Bool {
        if records.first?.percentOfCorrectAnswer == success {
            return true
        } else {
            return false
        }
    }
    
    private func calculateRate(
        records: [Record]
    ) -> Int {
        var rate = 0
        
        for record in records {
            rate += Int(record.percentOfCorrectAnswer ?? 0)
        }
        
        return rate
    }
    
    private func appendTopicRecords(
        for topic: String
    ) -> [Record] {
        var currentRecords: [Record] = []
        
        for record in records {
            if record.topic == topic {
                currentRecords.append(record)
            }
        }
        
        return currentRecords
    }
}
