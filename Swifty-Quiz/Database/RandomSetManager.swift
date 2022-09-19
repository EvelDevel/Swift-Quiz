
//  Created by Евгений Никитин on 01.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class RandomSetManager {
	
	private static var all: [Question] = []
	private static var guide: [Question] = []
	private static var patterns: [Question] = []
    private static var others: [Question] = []
    private static var uikit: [Question] = []
    private static var swiftui: [Question] = []
	
    // Эта функция всегда запускается при старте приложения, чтобы показать общее кол-во вопросов
    // Это вызывает цепную реакцию, которая запускает наполнение общего массива, массива по руководству и паттернам
    // То есть при старте программы, все эти основные массивы наполняются, и освобождаются только при выходе из приложение
    // Пустыми они быть не могут, но главное - чтобы отработала эта функция
    
	static func showAllQuestionsNumber() -> Int {
        return all.count == 0 ? getAllQuestions().count : all.count
	}
	
	static func getAllQuestions() -> [Question] {
		if all.isEmpty {
			all.append(contentsOf: RandomSetManager.getGuide())
			all.append(contentsOf: RandomSetManager.getPatterns())
            all.append(contentsOf: RandomSetManager.getOthers())
            all.append(contentsOf: RandomSetManager.getUIKit())
            all.append(contentsOf: RandomSetManager.getswiftUI())
		}
        
		return all
	}
	
	static func getGuide() -> [Question] {
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
	
	static func getPatterns() -> [Question] {
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
    
    static func getOthers() -> [Question] {
        if others.isEmpty {
            others.append(contentsOf: ExtremeProgrammingSet.getQuestions())
            others.append(contentsOf: MobileSecuritySet.getQuestions())
            others.append(contentsOf: Multithreading.getQuestions())
            others.append(contentsOf: Networking.getQuestions())
            others.append(contentsOf: APNS.getQuestions())
            others.append(contentsOf: FCM.getQuestions())
        }
        
        return others
    }
    
    static func getUIKit() -> [Question] {
        if uikit.isEmpty {
            uikit.append(contentsOf: VCLifecycleSet.getQuestions())
            uikit.append(contentsOf: AppLifecycleSet.getQuestions())
            uikit.append(contentsOf: FramesAndBounds.getQuestions())
            uikit.append(contentsOf: UIViewSet.getQuestions())
            uikit.append(contentsOf: AutoLayout.getQuestions())
        }
        
        return uikit
    }
    
    static func getswiftUI() -> [Question] {
        if swiftui.isEmpty {
            swiftui.append(contentsOf: SwiftUIEssentials.getQuestions())
            swiftui.append(contentsOf: DrawingAndAnimation.getQuestions())
            swiftui.append(contentsOf: AppDesignAndLayout.getQuestions())
            swiftui.append(contentsOf: FrameworkIntegration.getQuestions())
        }
        
        return swiftui
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
