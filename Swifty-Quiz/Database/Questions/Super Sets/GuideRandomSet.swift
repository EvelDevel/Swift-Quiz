
//  Created by Евгений Никитин on 22.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class GuideRandomSet {
    
    static func getQuestions(limit: Int) -> [Question] {
        
        var allQuestions: [Question] = []
        var allQuestionsShuffled: [Question] = []
        var arrayToReturn: [Question] = []
        
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
        
        /// Набираем нужное кол-во вопросов
        allQuestionsShuffled = allQuestions.shuffled()
        for index in 0..<limit {
            arrayToReturn.append(allQuestionsShuffled[index])
        }
        
        return arrayToReturn
    }
}
