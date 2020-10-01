
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class QuestionManager {
	
	private static var allQuestions: [Question] = []
	
	/// Все вопросы по руководству в свой массив
	static func appendGuide() -> [Question] {
		var guide: [Question] = []
		
		guide.append(contentsOf: TheBasicsSet.getQuestions())
		guide.append(contentsOf: BasicOperatorsSet.getQuestions())
		guide.append(contentsOf: StringAndCharactersSet.getQuestions())
		guide.append(contentsOf: CollectionTypesSet.getQuestions())
		guide.append(contentsOf: ControlFlowSet.getQuestions())
		guide.append(contentsOf: FunctionsSet.getQuestions())
		guide.append(contentsOf: ClosuresSet.getQuestions())
		guide.append(contentsOf: EnumerationsSet.getQuestions())
		guide.append(contentsOf: StructuresAndClassesSet.getQuestions())
		guide.append(contentsOf: PropertiesSet.getQuestions())
		guide.append(contentsOf: MethodsSet.getQuestions())
		guide.append(contentsOf: SubscriptsSet.getQuestions())
		guide.append(contentsOf: InheritanceSet.getQuestions())
		guide.append(contentsOf: InitializationSet.getQuestions())
		guide.append(contentsOf: DeinitializationSet.getQuestions())
		guide.append(contentsOf: ErrorHandlingSet.getQuestions())
		guide.append(contentsOf: OptionalChainingSet.getQuestions())
		guide.append(contentsOf: ARCSet.getQuestions())
		guide.append(contentsOf: TypeCastingSet.getQuestions())
		guide.append(contentsOf: NestedTypesSet.getQuestions())
		guide.append(contentsOf: ExtensionsSet.getQuestions())
		guide.append(contentsOf: GenericsSet.getQuestions())
		guide.append(contentsOf: ProtocolsSet.getQuestions())
		guide.append(contentsOf: AccessControlSet.getQuestions())
		guide.append(contentsOf: MemorySafetySet.getQuestions())
		guide.append(contentsOf: AdvancedOperatorsSet.getQuestions())
		
		return guide
	}
	
	/// Все вопросы по паттернам в свой массив
	static func appendPatterns() -> [Question] {
		var patterns: [Question] = []
		
		patterns.append(contentsOf: BasicsAboutPatternsSet.getQuestions())
		patterns.append(contentsOf: CreationalPatternsSet.getQuestions())
		patterns.append(contentsOf: StructuralPatternsSet.getQuestions())
		patterns.append(contentsOf: BehavioralPatternsSet.getQuestions())
		patterns.append(contentsOf: AntipatternsSet.getQuestions())
		
		return patterns
	}
	
	/// Получить общее количество
	static func getAllQuestionsCounter() -> Int {
		if allQuestions.isEmpty {
			allQuestions.append(contentsOf: QuestionManager.appendGuide())
			allQuestions.append(contentsOf: QuestionManager.appendPatterns())
		}
		return allQuestions.count
	}
	
	/// Получить массив всех вопросов
	static func getAllQuestions() -> [Question] {
		if allQuestions.isEmpty {
			allQuestions.append(contentsOf: QuestionManager.appendGuide())
			allQuestions.append(contentsOf: QuestionManager.appendPatterns())
		}
		return allQuestions
	}
}
