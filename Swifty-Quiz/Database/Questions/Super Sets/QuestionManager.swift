
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class QuestionManager {
	
	private static var allQuestions: [Question] = []
	
	/// Все вопросы по руководству в свой массив
	static func getAllFromGuide() -> [Question] {
		var allGuideQuestions: [Question] = []
		
		allGuideQuestions.append(contentsOf: TheBasicsSet.getQuestions())
		allGuideQuestions.append(contentsOf: BasicOperatorsSet.getQuestions())
		allGuideQuestions.append(contentsOf: StringAndCharactersSet.getQuestions())
		allGuideQuestions.append(contentsOf: CollectionTypesSet.getQuestions())
		allGuideQuestions.append(contentsOf: ControlFlowSet.getQuestions())
		allGuideQuestions.append(contentsOf: FunctionsSet.getQuestions())
		allGuideQuestions.append(contentsOf: ClosuresSet.getQuestions())
		allGuideQuestions.append(contentsOf: EnumerationsSet.getQuestions())
		allGuideQuestions.append(contentsOf: StructuresAndClassesSet.getQuestions())
		allGuideQuestions.append(contentsOf: PropertiesSet.getQuestions())
		allGuideQuestions.append(contentsOf: MethodsSet.getQuestions())
		allGuideQuestions.append(contentsOf: SubscriptsSet.getQuestions())
		allGuideQuestions.append(contentsOf: InheritanceSet.getQuestions())
		allGuideQuestions.append(contentsOf: InitializationSet.getQuestions())
		allGuideQuestions.append(contentsOf: DeinitializationSet.getQuestions())
		allGuideQuestions.append(contentsOf: ErrorHandlingSet.getQuestions())
		allGuideQuestions.append(contentsOf: OptionalChainingSet.getQuestions())
		allGuideQuestions.append(contentsOf: ARCSet.getQuestions())
		allGuideQuestions.append(contentsOf: TypeCastingSet.getQuestions())
		allGuideQuestions.append(contentsOf: NestedTypesSet.getQuestions())
		allGuideQuestions.append(contentsOf: ExtensionsSet.getQuestions())
		allGuideQuestions.append(contentsOf: GenericsSet.getQuestions())
		allGuideQuestions.append(contentsOf: ProtocolsSet.getQuestions())
		allGuideQuestions.append(contentsOf: AccessControlSet.getQuestions())
		allGuideQuestions.append(contentsOf: MemorySafetySet.getQuestions())
		allGuideQuestions.append(contentsOf: AdvancedOperatorsSet.getQuestions())
		
		return allGuideQuestions
	}
	
	/// Все вопросы по паттернам в свой массив
	static func getAllFromPatterns() -> [Question] {
		var allPatternsQuestions: [Question] = []
		
		allPatternsQuestions.append(contentsOf: BasicsAboutPatternsSet.getQuestions())
		allPatternsQuestions.append(contentsOf: CreationalPatternsSet.getQuestions())
		allPatternsQuestions.append(contentsOf: StructuralPatternsSet.getQuestions())
		allPatternsQuestions.append(contentsOf: BehavioralPatternsSet.getQuestions())
		allPatternsQuestions.append(contentsOf: AntipatternsSet.getQuestions())
		
		return allPatternsQuestions
	}
	
	/// Получить общее количество
	static func getAllQuestionsCounter() -> Int {
		if allQuestions.isEmpty {
			allQuestions.append(contentsOf: QuestionManager.getAllFromGuide())
			allQuestions.append(contentsOf: QuestionManager.getAllFromPatterns())
		}
		return allQuestions.count
	}
	
	/// Получить массив всех вопросов
	static func getAllQuestions() -> [Question] {
		if allQuestions.isEmpty {
			allQuestions.append(contentsOf: QuestionManager.getAllFromGuide())
			allQuestions.append(contentsOf: QuestionManager.getAllFromPatterns())
		}
		return allQuestions
	}
}
