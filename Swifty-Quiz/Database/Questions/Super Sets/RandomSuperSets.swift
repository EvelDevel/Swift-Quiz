
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class RandomSuperSets {
    
    private static var allQuestions: [Question] = []
    private static var allQuestionsShuffled: [Question] = []
    private static var arrayToReturn: [Question] = []
    
    static func getQuestions(limit: Int) -> [Question] {
        
        /// Обнуляем массивы
        allQuestions = []
        arrayToReturn = []
        
        allQuestions.append(contentsOf: TheBasicsSet.getQuestions())
        allQuestions.append(contentsOf: BasicOperatorsSet.getQuestions())
        allQuestions.append(contentsOf: StringAndCharactersSet.getQuestions())
        
        allQuestions.append(contentsOf: CollectionTypesSet.getQuestions())
        allQuestions.append(contentsOf: ControlFlowSet.getQuestions())

        allQuestions.append(contentsOf: FunctionsSet.getQuestions())
        allQuestions.append(contentsOf: ClosuresSet.getQuestions())
        allQuestions.append(contentsOf: EnumerationsSet.getQuestions())

        allQuestions.append(contentsOf: StructuresAndClassesSet.getQuestions())
        allQuestions.append(contentsOf: PropertiesSet.getQuestions())
        allQuestions.append(contentsOf: MethodsSet.getQuestions())

        allQuestions.append(contentsOf: SubscriptsSet.getQuestions())
        allQuestions.append(contentsOf: InheritanceSet.getQuestions())
        allQuestions.append(contentsOf: InitializationSet.getQuestions())

        allQuestions.append(contentsOf: DeinitializationSet.getQuestions())
        allQuestions.append(contentsOf: ErrorHandlingSet.getQuestions())

        allQuestions.append(contentsOf: OptionalChainingSet.getQuestions())
        allQuestions.append(contentsOf: ARCSet.getQuestions())

        allQuestions.append(contentsOf: TypeCastingSet.getQuestions())
        allQuestions.append(contentsOf: NestedTypesSet.getQuestions())
        allQuestions.append(contentsOf: ExtensionsSet.getQuestions())

        allQuestions.append(contentsOf: GenericsSet.getQuestions())
        allQuestions.append(contentsOf: ProtocolsSet.getQuestions())

        allQuestions.append(contentsOf: AccessControlSet.getQuestions())
        allQuestions.append(contentsOf: MemorySafetySet.getQuestions())

        allQuestions.append(contentsOf: AdvancedOperatorsSet.getQuestions())
        
        ///
        
        allQuestions.append(contentsOf: CreationalPatternsSet.getQuestions())
        allQuestions.append(contentsOf: StructuralPatternsSet.getQuestions())
        
        allQuestions.append(contentsOf: BehavioralPatternsSet.getQuestions())
        allQuestions.append(contentsOf: AntipatternsSet.getQuestions())
        
        /// Набираем нужное кол-во вопросов по выбранной категории
        allQuestionsShuffled = allQuestions.shuffled()
        for index in 0..<limit {
            arrayToReturn.append(allQuestionsShuffled[index])
        }
        
        return arrayToReturn
    }
    
    /// Получить общее количество вопросов
    static func showTotalquestionsNumber() -> Int {
        return allQuestions.count
    }
}
