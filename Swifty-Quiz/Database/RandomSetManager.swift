
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class RandomSetManager {
	
	private static var all: [Question] = []
	private static var guide: [Question] = []
	private static var patterns: [Question] = []
    private static var new: [Question] = []
	
    // Эта функция всегда запускается при старте приложения, чтобы показать общее кол-во вопросов
    // Это вызывает цепную реакцию, которая запускает наполнение общего массива, массива по руководству и паттернам
    // То есть при старте программы, все эти основные массивы наполняются, и освобождаются только при выходе из приложение
    // Пустыми они быть не могут, но главное - чтобы отработала эта функция
    
	static func showAllQuestionsNumber() -> Int {
		return getAllQuestions().count
	}
	
	static func getAllQuestions() -> [Question] {
		if all.isEmpty {
			all.append(contentsOf: RandomSetManager.setAndGetGuideQuestions())
			all.append(contentsOf: RandomSetManager.setAndGetPatternsQuestions())
            all.append(contentsOf: RandomSetManager.setAndGetOtherQuestions())
		}
		return all
	}
	
	static func setAndGetGuideQuestions() -> [Question] {
		if guide.isEmpty {
			guide.append(contentsOf: TheBasicsSet.getQuestions())
            guide.append(contentsOf: IntegersAndBooleansSet.getQuestions())
			guide.append(contentsOf: BasicOperatorsSet.getQuestions())
            guide.append(contentsOf: RangeOperatorsSet.getQuestions())
            guide.append(contentsOf: BooleanOperatorsSet.getQuestions())
			guide.append(contentsOf: StringAndCharactersSet.getQuestions())
			guide.append(contentsOf: CollectionsSet.getQuestions())
            guide.append(contentsOf: SetsSet.getQuestions())
            guide.append(contentsOf: DictionariesSet.getQuestions())
            guide.append(contentsOf: TuplesSet.getQuestions())
			guide.append(contentsOf: ControlFlowSet.getQuestions())
            guide.append(contentsOf: OptionalTypesSet.getQuestions())
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
            guide.append(contentsOf: ConcurrencySet.getQuestions())
			guide.append(contentsOf: OptionalChainingSet.getQuestions())
			guide.append(contentsOf: ARCSet.getQuestions())
			guide.append(contentsOf: TypeCastingSet.getQuestions())
			guide.append(contentsOf: NestedTypesSet.getQuestions())
			guide.append(contentsOf: ExtensionsSet.getQuestions())
            guide.append(contentsOf: OpaqueTypeSet.getQuestions())
			guide.append(contentsOf: GenericsSet.getQuestions())
			guide.append(contentsOf: ProtocolsSet.getQuestions())
			guide.append(contentsOf: AccessControlSet.getQuestions())
			guide.append(contentsOf: MemorySafetySet.getQuestions())
			guide.append(contentsOf: AdvancedOperatorsSet.getQuestions())
		}
		return guide
	}
	
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
    
    static func setAndGetOtherQuestions() -> [Question] {
        if new.isEmpty {
            new.append(contentsOf: ExtremeProgrammingSet.getQuestions())
            new.append(contentsOf: MobileSecuritySet.getQuestions())
            new.append(contentsOf: VCLifecycleSet.getQuestions())
            new.append(contentsOf: AppLifecycleSet.getQuestions())
            new.append(contentsOf: FramesAndBounds.getQuestions())
            new.append(contentsOf: Multithreading.getQuestions())
            new.append(contentsOf: UIViewSet.getQuestions())
            new.append(contentsOf: AutoLayout.getQuestions())
        }
        return new
    }
    
	static func getQuestions(_ limit: Int) -> [Question] {
		let shuffled = all.isEmpty ? getAllQuestions().shuffled() : all.shuffled()
		var final: [Question] = []
        
		for index in 0..<limit {
			final.append(shuffled[index])
		}
		return final
	}
}
