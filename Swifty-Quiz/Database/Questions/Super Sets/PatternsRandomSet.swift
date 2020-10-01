
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class PatternsRandomSet {
    
    static func getQuestions(limit: Int) -> [Question] {
        
        var allQuestions: [Question] = []
        var allQuestionsShuffled: [Question] = []
        var arrayToReturn: [Question] = []
        
		allQuestions.append(contentsOf: BasicsAboutPatternsSet.getQuestions())
        allQuestions.append(contentsOf: CreationalPatternsSet.getQuestions())
        allQuestions.append(contentsOf: StructuralPatternsSet.getQuestions())
        allQuestions.append(contentsOf: BehavioralPatternsSet.getQuestions())
        allQuestions.append(contentsOf: AntipatternsSet.getQuestions())
        
        /// Набираем нужное кол-во вопросов
        allQuestionsShuffled = allQuestions.shuffled()
        for index in 0..<limit {
            arrayToReturn.append(allQuestionsShuffled[index])
        }
        
        return arrayToReturn
    }
}
