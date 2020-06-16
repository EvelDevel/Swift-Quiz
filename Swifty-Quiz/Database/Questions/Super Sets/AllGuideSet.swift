
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class AllGuideSet {
    static func getQuestions() -> [Question] {
        
        var allGuideQuestions: [Question] = []
        ///
        allGuideQuestions.append(contentsOf: TheBasicsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: BasicOperatorsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: StringAndCharactersSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: CollectionTypesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ControlFlowSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: FunctionsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ClosuresSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: EnumerationsSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: StructuresAndClassesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: PropertiesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: MethodsSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: SubscriptsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: InheritanceSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: InitializationSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: DeinitializationSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ErrorHandlingSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: OptionalChainingSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ARCSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: TypeCastingSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: NestedTypesSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ExtensionsSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: GenericsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: ProtocolsSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: AccessControlSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: MemorySafetySet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: AdvancedOperatorsSet.getQuestions().shuffled())
        
        return allGuideQuestions.shuffled()
    }
}
