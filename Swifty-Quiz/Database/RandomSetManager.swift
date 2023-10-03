
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class RandomSetManager {
	private var all: [Question] = []
    private var allInterviews: [Question] = []
	private var guide: [Question] = []
	private var patterns: [Question] = []
    private var others: [Question] = []
    private var uikit: [Question] = []
    private var swiftui: [Question] = []
	
    // Общее количество вопросов в игре
	func showAllQuestionsNumber() -> Int {
        return all.count == 0 ? getAllQuestions().count : all.count
	}
    
    // Массив всех вопросов игры
    func getAllQuestions() -> [Question] {
        if all.isEmpty {
            let lock = NSLock()
            let startTime = CFAbsoluteTimeGetCurrent()
            
            addQuestions(&all, lock: lock, questions: getInterviews())
            addQuestions(&all, lock: lock, questions: getGuide())
            addQuestions(&all, lock: lock, questions: getPatterns())
            addQuestions(&all, lock: lock, questions: getOthers())
            addQuestions(&all, lock: lock, questions: getUIKit())
            addQuestions(&all, lock: lock, questions: getswiftUI())
            
            let endTime = CFAbsoluteTimeGetCurrent()
            let executionTime = endTime - startTime
            print("Выполнение getAllQuestions: \(executionTime) секунд")
        }
        
        return all
    }

    // Обработка через мьютекс
    private func addQuestions(
        _ all: inout [Question],
        lock: NSLock,
        questions: [Question]
    ) {
        lock.lock()
        all.append(contentsOf: questions)
        lock.unlock()
    }
    
    // Массив по собесам
    func getInterviews() -> [Question] {
        if allInterviews.isEmpty {
            allInterviews.append(contentsOf: InterviewIntern.getQuestions())
            allInterviews.append(contentsOf: InterviewJunior.getQuestions())
            allInterviews.append(contentsOf: InterviewJuniorPlus.getQuestions())
            allInterviews.append(contentsOf: InterviewMiddle.getQuestions())
            allInterviews.append(contentsOf: InterviewMiddlePlus.getQuestions())
            allInterviews.append(contentsOf: InterviewSenior.getQuestions())
            allInterviews.append(contentsOf: InterviewSeniorPlus.getQuestions())
        }
        
        return allInterviews
    }
	
    // Массив по руководству
    func getGuide() -> [Question] {
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
            guide.append(contentsOf: MacrosSet.getQuestions())
		}
        
		return guide
	}
	
    // Массив по паттернам
    func getPatterns() -> [Question] {
		if patterns.isEmpty {
			patterns.append(contentsOf: BasicsAboutPatternsSet.getQuestions())
			patterns.append(contentsOf: CreationalPatternsSet.getQuestions())
			patterns.append(contentsOf: StructuralPatternsSet.getQuestions())
			patterns.append(contentsOf: BehavioralPatternsSet.getQuestions())
			patterns.append(contentsOf: AntipatternsSet.getQuestions())
            patterns.append(contentsOf: DepenpencyInjection.getQuestions())
            patterns.append(contentsOf: InversionOfControl.getQuestions())
            patterns.append(contentsOf: ServiceLocator.getQuestions())
		}
        
		return patterns
	}
    
    // Массив по "Разное"
    func getOthers() -> [Question] {
        if others.isEmpty {
            others.append(contentsOf: ExtremeProgrammingSet.getQuestions())
            others.append(contentsOf: MobileSecuritySet.getQuestions())
            others.append(contentsOf: Multithreading.getQuestions())
            others.append(contentsOf: Networking.getQuestions())
            others.append(contentsOf: APNS.getQuestions())
        }
        
        return others
    }
    
    // Массив по UIKit
    func getUIKit() -> [Question] {
        if uikit.isEmpty {
            uikit.append(contentsOf: VCLifecycleSet.getQuestions())
            uikit.append(contentsOf: AppLifecycleSet.getQuestions())
            uikit.append(contentsOf: FramesAndBounds.getQuestions())
            uikit.append(contentsOf: UIViewSet.getQuestions())
            uikit.append(contentsOf: AutoLayout.getQuestions())
        }
        
        return uikit
    }
    
    // Массив по СвифтЮай
    func getswiftUI() -> [Question] {
        if swiftui.isEmpty {
            swiftui.append(contentsOf: SwiftUIEssentials.getQuestions())
            swiftui.append(contentsOf: DrawingAndAnimation.getQuestions())
        }
        
        return swiftui
    }
    
    // Получить порцию случайных вопросов из общего массива
    func getQuestions(_ limit: Int) -> [Question] {
		let shuffled = all.isEmpty ? getAllQuestions().shuffled() : all.shuffled()
		var final: [Question] = []
        
		for index in 0..<limit {
			final.append(shuffled[index])
		}
        
		return final
	}
}
