//
//  GameResult.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 02.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

struct GameResult {
    var result: Int
    var totalQuestion: Int
    var percentOfCorrect: Double
    var topic: String
    var helpCounter: Int
    var playedNum: Int
}
