
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class AllGuideSet {
    
    static var allGuideQuestions: [Question] = []
    
    static func addQuestions() {
        
        /// Эта функция запускается асинхронно при загрузке приложения
        /// Сделано для того, чтобы мы создавали массив фоном
        /// А не в момент нажатия на супер-игру (в выборе тем)
        
        allGuideQuestions.append(contentsOf: TheBasicsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: BasicOperatorsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: StringAndCharactersSet.getQuestions().shuffled())
        
        allGuideQuestions.append(contentsOf: CollectionTypesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ControlFlowSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: FunctionsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ClosuresSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: EnumerationsSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: StructuresAndClassesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: PropertiesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: MethodsSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: SubscriptsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: InheritanceSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: InitializationSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: DeinitializationSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ErrorHandlingSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: OptionalChainingSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ARCSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: TypeCastingSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: NestedTypesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ExtensionsSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: GenericsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ProtocolsSet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: AccessControlSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: MemorySafetySet.getQuestions().shuffled())

        allGuideQuestions.append(contentsOf: AdvancedOperatorsSet.getQuestions().shuffled())
        
        print("Мы асинхронно создали массив для суперигры по Руководству: \(allGuideQuestions.count)")
    }
    
    static func getQuestions() -> [Question] {
        allGuideQuestions
    }
}


// MARK: Если не разберусь как сделать, чтобы не лагал выбор супер игры в выборе тем
/// Можно ограничить до 50 случайных вопросов при каждом выборе темы, тогда все летает
/// Но становится не очевидным рефрешь этой игры:
/// - приходится либо снова тыкать на категорию без звука
/// - или тыкать на соседнюю потом снова на эту (оба варианта туповаты)

//static func getQuestions() -> [Question] {
//    let allQuestionsShuffled = allGuideQuestions.shuffled()
//    var tempArray: [Question] = []
//    for i in 0..<50 {
//        tempArray.append(allQuestionsShuffled[i])
//    }
//    return tempArray
//}
