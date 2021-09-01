//
//  AppLifecycleSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 01.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class AppLifecycleSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["?"],
                     image: "",
                     optionA: "1",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     questionId: 633011261,
                     helpText: "!"),
        ]
    }
}
