
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class QueuesSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 1,
                     helpText: "")
        ]
    }
}
