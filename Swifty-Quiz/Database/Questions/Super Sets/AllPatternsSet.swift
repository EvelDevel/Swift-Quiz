
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class AllPatternsSet {
    
    static var allPatternsQuestions: [Question] = []
    
    static func addQuestions() {
        
        /// Эта функция запускается асинхронно при загрузке приложения
        /// Сделано для того, чтобы мы создавали массив фоном
        /// А не в момент нажатия на супер-игру в выборе тем
        
        allPatternsQuestions.append(contentsOf: BasicPatternsSet.getQuestions().shuffled())
        allPatternsQuestions.append(contentsOf: AdvancedPatternsSet.getQuestions().shuffled())
        
        allPatternsQuestions.append(contentsOf: ArchitecturalPatternsSet.getQuestions().shuffled())
        allPatternsQuestions.append(contentsOf: AntipatternsSet.getQuestions().shuffled())
        
        print("Мы асинхронно создали массив для суперигры по Паттернам: \(allPatternsQuestions.count)")
    }
    
    static func getQuestions() -> [Question] {
        return allPatternsQuestions
    }
}


// MARK: Если не разберусь как сделать, чтобы не лагал выбор супер игры в выборе тем
/// Можно ограничить до 50 случайных вопросов при каждом выборе темы, тогда все летает
/// Но становится не очевидным рефрешь этой игры:
/// - приходится либо снова тыкать на категорию без звука
/// - или тыкать на соседнюю потом снова на эту (оба варианта туповаты)

//static func getQuestions() -> [Question] {
//    let allQuestionsShuffled = allPatternsQuestions.shuffled()
//    var tempArray: [Question] = []
//    for i in 0..<50 {
//        tempArray.append(allQuestionsShuffled[i])
//    }
//    return tempArray
//}
