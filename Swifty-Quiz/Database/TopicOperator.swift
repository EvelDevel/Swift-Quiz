
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class TopicOperator {
    
    static func getRandom20() -> [Question] { return RandomSetManager.getQuestions(20) }
    static func getRandom50() -> [Question] { return RandomSetManager.getQuestions(50) }
    static func getRandom100() -> [Question] { return RandomSetManager.getQuestions(100) }
    static func deathMatch() -> [Question] { return RandomSetManager.getAllQuestions() }
    
    static func getQuestionsExtremeProgramming() -> [Question] { return ExtremeProgrammingSet.getQuestions() }
    static func getQuestionsMobileSecurity() -> [Question] { return MobileSecuritySet.getQuestions() }
    static func getQuestionsLifecycle() -> [Question] { return VCLifecycleSet.getQuestions() }
    static func getQuestionsAppLifecycle() -> [Question] { return AppLifecycleSet.getQuestions() }
    static func getQuestionsFramesAndBounds() -> [Question] { return FramesAndBounds.getQuestions() }
    static func getQuestionsMultithreading() -> [Question] { return Multithreading.getQuestions() }
    static func getQuestionsUIViewSet() -> [Question] { return UIViewSet.getQuestions() }
    static func getQuestionsAutoLayout() -> [Question] { return AutoLayout.getQuestions() }
    
    static func getQuestionsDependencyInjection() -> [Question] { return DepenpencyInjection.getQuestions() }
    static func getQuestionsInversionOfControl() -> [Question] { return InversionOfControl.getQuestions() }
    static func getQuestionsServiceLocator() -> [Question] { return ServiceLocator.getQuestions() }
    
    static func getTheBasics() -> [Question] { return TheBasicsSet.getQuestions() }
    static func getIntegersAndBooleans() -> [Question] { return IntegersAndBooleansSet.getQuestions() }
    static func getBasicOperators() -> [Question] { return BasicOperatorsSet.getQuestions() }
    static func getRangeOperators() -> [Question] { return RangeOperatorsSet.getQuestions() }
    static func getBooleanOperators() -> [Question] { return BooleanOperatorsSet.getQuestions() }
    static func getStringAndCharacters() -> [Question] { return StringAndCharactersSet.getQuestions() }
    static func getCollections() -> [Question] { return CollectionsSet.getQuestions() }
    static func getSets() -> [Question] { return SetsSet.getQuestions() }
    static func getDictionaries() -> [Question] { return DictionariesSet.getQuestions() }
    static func getTuples() -> [Question] { return TuplesSet.getQuestions() }
    static func getControlFlow() -> [Question] { return ControlFlowSet.getQuestions() }
    static func getOptionalTypes() -> [Question] { return OptionalTypesSet.getQuestions() }
    static func getFunctions() -> [Question] { return FunctionsSet.getQuestions() }
    static func getClosures() -> [Question] { return ClosuresSet.getQuestions() }
    static func getEnums() -> [Question] { return EnumerationsSet.getQuestions() }
    static func getStructuresAndClasses() -> [Question] { return StructuresAndClassesSet.getQuestions() }
    static func getProperties() -> [Question] { return PropertiesSet.getQuestions() }
    static func getMethods() -> [Question] { return MethodsSet.getQuestions() }
    static func getSubscripts() -> [Question] { return SubscriptsSet.getQuestions() }
    static func getInheritance() -> [Question] { return InheritanceSet.getQuestions() }
    static func getInitialization() -> [Question] { return InitializationSet.getQuestions() }
    static func getDeinitialization() -> [Question] { return DeinitializationSet.getQuestions() }
    static func getErrorHandling() -> [Question] { return ErrorHandlingSet.getQuestions() }
    static func getConcurrency() -> [Question] { return ConcurrencySet.getQuestions() }
    static func getOptionalChaining() -> [Question] { return OptionalChainingSet.getQuestions() }
    static func getARC() -> [Question] { return ARCSet.getQuestions() }
    static func getTypeCasting() -> [Question] { return TypeCastingSet.getQuestions() }
    static func getNestedTypes() -> [Question] { return NestedTypesSet.getQuestions() }
    static func getExtensions() -> [Question] { return ExtensionsSet.getQuestions() }
    static func getOpaqueTypes() -> [Question] { return OpaqueTypeSet.getQuestions() }
    static func getGenerics() -> [Question] { return GenericsSet.getQuestions() }
    static func getProtocols() -> [Question] { return ProtocolsSet.getQuestions() }
    static func getAccessControl() -> [Question] { return AccessControlSet.getQuestions() }
    static func getMemorySafety() -> [Question] { return MemorySafetySet.getQuestions() }
    static func getAdvancedOperators() -> [Question] { return AdvancedOperatorsSet.getQuestions() }
   
    static func getQuestionsBasicsAboutPatterns() -> [Question] { return BasicsAboutPatternsSet.getQuestions() }  
    static func getQuestionsCreationalPatterns() -> [Question] { return CreationalPatternsSet.getQuestions() }  
    static func getQuestionsStructuralPatterns() -> [Question] { return StructuralPatternsSet.getQuestions() }
    static func getQuestionsBehavioralPatterns() -> [Question] { return BehavioralPatternsSet.getQuestions() }
    static func getQuestionsAntipatterns() -> [Question] { return AntipatternsSet.getQuestions() }
    
    static func getQuestionsNetworking() -> [Question] { return Networking.getQuestions() }
}
