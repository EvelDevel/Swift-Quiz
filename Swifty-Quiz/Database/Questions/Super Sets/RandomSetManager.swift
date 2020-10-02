
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

enum RandomType {
	case all
	case patterns
	case guide
}

class RandomSetManager {
	
	private static var all: [Question] = []
	private static var guide: [Question] = []
	private static var patterns: [Question] = []
	
	// Получить общее количество всех вопросов
	static func showAllQuestionsNumber() -> Int {
		
		// Эта функция всегда запускается при старте приложения, чтобы показать общее кол-во вопросов
		// Это вызывает цепную реакцию, которая запускает наполнение общего массива, массива по руководству и паттернам
		// То есть при старте программы, все эти основные массивы наполняются, и освобождаются только при выходе из приложение
		// Пустыми они быть не могут, но главное - чтобы отработала эта функция
		
		return setAndGetAllQuestions().count
	}
	
	// Получить массив всех вопросов
	static func setAndGetAllQuestions() -> [Question] {
		if all.isEmpty {
			all.append(contentsOf: RandomSetManager.setAndGetGuideQuestions())
			all.append(contentsOf: RandomSetManager.setAndGetPatternsQuestions())
		}
		return all
	}
	
	// Получить массив всех вопросов по Руководству
	static func setAndGetGuideQuestions() -> [Question] {
		if guide.isEmpty {
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
		}
		
		return guide
	}
	
	// Получить массив всех вопросов по Паттернам
	static func setAndGetPatternsQuestions() -> [Question] {
		if patterns.isEmpty {
			patterns.append(contentsOf: BasicsAboutPatternsSet.getQuestions())
			patterns.append(contentsOf: CreationalPatternsSet.getQuestions())
			patterns.append(contentsOf: StructuralPatternsSet.getQuestions())
			patterns.append(contentsOf: BehavioralPatternsSet.getQuestions())
			patterns.append(contentsOf: AntipatternsSet.getQuestions())
		}
		
		return patterns
	}
	
	// Формируем пачки случайных вопросов
	static func getQuestions(_ limit: Int, _ type: RandomType) -> [Question] {
		var shuffled: [Question] = []
		var toReturn: [Question] = []
		
		switch type {
		case .all: 		shuffled = all.shuffled()
		case .guide: 	shuffled = guide.shuffled()
		case .patterns: shuffled = patterns.shuffled()
		}
		
		for index in 0..<limit {
			toReturn.append(shuffled[index])
		}
		
		return toReturn
	}
}
