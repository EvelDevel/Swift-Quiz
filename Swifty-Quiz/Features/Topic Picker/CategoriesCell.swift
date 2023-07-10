
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol CategoriesCellDelegate: AnyObject {
    func updateSelectedTopic()
    func updateSuccessRate(rate: Int)
    func showAlert()
}

private class Interface {
    static var borderWidth = 1.0
    static var borderColor = UIColor.lightGray.cgColor
}

class CategoriesCell: UITableViewCell {
    private var allButtons: [UIButton] = []
    
    @IBOutlet private var random: [UIButton]!
    @IBOutlet private var swiftui: [UIButton]!
    @IBOutlet private var uikit: [UIButton]!
    @IBOutlet private var guide: [UIButton]!
    @IBOutlet private var patterns: [UIButton]!
    @IBOutlet private var others: [UIButton]!
    
    weak var delegate: CategoriesCellDelegate?
    
    private var currentPosition = SelectedTopic.shared.topic.topicTag
    private let progress = ProgressService()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        delegate?.showAlert()
    }
    
    private func setup() {
        appendAllButtons()
        setFontSize()
        addShadows()
        setupProgressToButtons()
        addQuestionsToArray(tag: 0)
    }
    
    private func setupProgressToButtons() {
        for button in allButtons {
            button.layer.backgroundColor = progress.getProgress(
                for: getTopicName(for: button.tag)
            ).progressColor
            
            button.layer.borderWidth = 0
        }
    }
    
    @IBAction private func topicButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if sender.tag - 1 != self.currentPosition {
                self.setupProgressToButtons()
                sender.layer.borderWidth = Interface.borderWidth
                sender.layer.borderColor = Interface.borderColor
                
                SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
                
                let tag = sender.tag
                DispatchQueue.global().async {
                    self.addQuestionsToArray(tag: tag)
                    
                    DispatchQueue.main.async {
                        self.delegate?.updateSelectedTopic()
                    }
                }
                
                if sender.tag > 10 {
                    self.delegate?.updateSuccessRate(
                        rate: self.progress.getProgress(
                            for: self.getTopicName(
                                for: sender.tag
                            )
                        ).progressRate
                    )
                }
                
                Game.shared.updateContinueStatus()
                self.currentPosition = sender.tag - 1
            }
        }
    }
}


// MARK: - Работа с UI наших аутлетов

extension CategoriesCell {
    /// Объединяем аутлеты в пачку
    func appendAllButtons() {
        allButtons.append(contentsOf: random)
        allButtons.append(contentsOf: guide)
        allButtons.append(contentsOf: patterns)
        allButtons.append(contentsOf: others)
        allButtons.append(contentsOf: uikit)
        allButtons.append(contentsOf: swiftui)
    }
    
    /// Добавляем тени кнопкам
    func addShadows() {
        DispatchQueue.main.async {
            Shadow().addTopicButtonShadows(self.allButtons)
        }
    }
    
    /// Размер шрифта
    func setFontSize() {
        allButtons.forEach() { button in
            if UIScreen.main.bounds.size.width > 320 {
                button.titleLabel?.font = .systemFont(
                    ofSize: 13,
                    weight: .light
                )
            } else {
                button.titleLabel?.font = .systemFont(
                    ofSize: 10
                )
            }
        }
    }
}


// MARK: - Выбор категории

extension CategoriesCell {
    func addQuestionsToArray(tag: Int) {
        let currentTag = SelectedTopic.shared.topic.topicTag
        
        switch tag {
        case 1:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(20),
                topic: CategoriesName.random20.rawValue,
                tag: tag - 1
            )
        case 2:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(50),
                topic: CategoriesName.random50.rawValue,
                tag: tag - 1
            )
        case 3:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(100),
                topic: CategoriesName.random100.rawValue,
                tag: tag - 1
            )
        case 4:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getAllQuestions(),
                topic: CategoriesName.deathMatch.rawValue,
                tag: tag - 1
            )
        case 12:
            SelectedTopic.shared.saveQuestionSet(
                TheBasicsSet.getQuestions(),
                topic: CategoriesName.basic.rawValue,
                tag: tag - 1
            )
        case 13:
            SelectedTopic.shared.saveQuestionSet(
                IntegersAndBooleansSet.getQuestions(),
                topic: CategoriesName.integersAndBooleans.rawValue,
                tag: tag - 1
            )
        case 14:
            SelectedTopic.shared.saveQuestionSet(
                BasicOperatorsSet.getQuestions(),
                topic: CategoriesName.basicOperators.rawValue,
                tag: tag - 1
            )
        case 15:
            SelectedTopic.shared.saveQuestionSet(
                RangeOperatorsSet.getQuestions(),
                topic: CategoriesName.rangeOperators.rawValue,
                tag: tag - 1
            )
        case 16:
            SelectedTopic.shared.saveQuestionSet(
                BooleanOperatorsSet.getQuestions(),
                topic: CategoriesName.booleanOperators.rawValue,
                tag: tag - 1
            )
        case 17:
            SelectedTopic.shared.saveQuestionSet(
                StringAndCharactersSet.getQuestions(),
                topic: CategoriesName.stringAndCharacters.rawValue,
                tag: tag - 1
            )
        case 18:
            SelectedTopic.shared.saveQuestionSet(
                CollectionsSet.getQuestions(),
                topic: CategoriesName.collections.rawValue,
                tag: tag - 1
            )
        case 19:
            SelectedTopic.shared.saveQuestionSet(
                SetsSet.getQuestions(),
                topic: CategoriesName.sets.rawValue,
                tag: tag - 1
            )
        case 20:
            SelectedTopic.shared.saveQuestionSet(
                DictionariesSet.getQuestions(),
                topic: CategoriesName.dictionaries.rawValue,
                tag: tag - 1
            )
        case 21:
            SelectedTopic.shared.saveQuestionSet(
                TuplesSet.getQuestions(),
                topic: CategoriesName.tuples.rawValue,
                tag: tag - 1
            )
        case 22:
            SelectedTopic.shared.saveQuestionSet(
                ControlFlowSet.getQuestions(),
                topic: CategoriesName.controlFlow.rawValue,
                tag: tag - 1
            )
        case 23:
            SelectedTopic.shared.saveQuestionSet(
                OptionalTypesSet.getQuestions(),
                topic: CategoriesName.optionals.rawValue,
                tag: tag - 1
            )
        case 24:
            SelectedTopic.shared.saveQuestionSet(
                FunctionsSet.getQuestions(),
                topic: CategoriesName.functions.rawValue,
                tag: tag - 1
            )
        case 25:
            SelectedTopic.shared.saveQuestionSet(
                ClosuresSet.getQuestions(),
                topic: CategoriesName.closures.rawValue,
                tag: tag - 1
            )
        case 26:
            SelectedTopic.shared.saveQuestionSet(
                EnumerationsSet.getQuestions(),
                topic: CategoriesName.enums.rawValue,
                tag: tag - 1
            )
        case 27:
            SelectedTopic.shared.saveQuestionSet(
                StructuresAndClassesSet.getQuestions(),
                topic: CategoriesName.structuresAndClasses.rawValue,
                tag: tag - 1
            )
        case 28:
            SelectedTopic.shared.saveQuestionSet(
                PropertiesSet.getQuestions(),
                topic: CategoriesName.properties.rawValue,
                tag: tag - 1
            )
        case 29:
            SelectedTopic.shared.saveQuestionSet(
                MethodsSet.getQuestions(),
                topic: CategoriesName.methods.rawValue,
                tag: tag - 1
            )
        case 30:
            SelectedTopic.shared.saveQuestionSet(
                SubscriptsSet.getQuestions(),
                topic: CategoriesName.subscripts.rawValue,
                tag: tag - 1
            )
        case 31:
            SelectedTopic.shared.saveQuestionSet(
                InheritanceSet.getQuestions(),
                topic: CategoriesName.inheritance.rawValue,
                tag: tag - 1
            )
        case 32:
            SelectedTopic.shared.saveQuestionSet(
                InitializationSet.getQuestions(),
                topic: CategoriesName.initialization.rawValue,
                tag: tag - 1
            )
        case 33:
            SelectedTopic.shared.saveQuestionSet(
                DeinitializationSet.getQuestions(),
                topic: CategoriesName.deinitialization.rawValue,
                tag: tag - 1
            )
        case 34:
            SelectedTopic.shared.saveQuestionSet(
                ErrorHandlingSet.getQuestions(),
                topic: CategoriesName.errorHandling.rawValue,
                tag: tag - 1
            )
        case 35:
            SelectedTopic.shared.saveQuestionSet(
                ConcurrencySet.getQuestions(),
                topic: CategoriesName.concurrency.rawValue,
                tag: tag - 1
            )
        case 36:
            SelectedTopic.shared.saveQuestionSet(
                OptionalChainingSet.getQuestions(),
                topic: CategoriesName.optionalChaining.rawValue,
                tag: tag - 1
            )
        case 37:
            SelectedTopic.shared.saveQuestionSet(
                ARCSet.getQuestions(),
                topic: CategoriesName.arc.rawValue,
                tag: tag - 1
            )
        case 38:
            SelectedTopic.shared.saveQuestionSet(
                TypeCastingSet.getQuestions(),
                topic: CategoriesName.typeCasting.rawValue,
                tag: tag - 1
            )
        case 39:
            SelectedTopic.shared.saveQuestionSet(
                NestedTypesSet.getQuestions(),
                topic: CategoriesName.nestedTypes.rawValue,
                tag: tag - 1
            )
        case 40:
            SelectedTopic.shared.saveQuestionSet(
                ExtensionsSet.getQuestions(),
                topic: CategoriesName.extensions.rawValue,
                tag: tag - 1
            )
        case 41:
            SelectedTopic.shared.saveQuestionSet(
                OpaqueTypeSet.getQuestions(),
                topic: CategoriesName.opaqueType.rawValue,
                tag: tag - 1
            )
        case 42:
            SelectedTopic.shared.saveQuestionSet(
                GenericsSet.getQuestions(),
                topic: CategoriesName.generics.rawValue,
                tag: tag - 1
            )
        case 43:
            SelectedTopic.shared.saveQuestionSet(
                ProtocolsSet.getQuestions(),
                topic: CategoriesName.protocols.rawValue,
                tag: tag - 1
            )
        case 44:
            SelectedTopic.shared.saveQuestionSet(
                AccessControlSet.getQuestions(),
                topic: CategoriesName.accessControl.rawValue,
                tag: tag - 1
            )
        case 45:
            SelectedTopic.shared.saveQuestionSet(
                MemorySafetySet.getQuestions(),
                topic: CategoriesName.memorySafety.rawValue,
                tag: tag - 1
            )
        case 46:
            SelectedTopic.shared.saveQuestionSet(
                AdvancedOperatorsSet.getQuestions(),
                topic: CategoriesName.advancedOperators.rawValue,
                tag: tag - 1
            )
        case 50:
            SelectedTopic.shared.saveQuestionSet(
                BasicsAboutPatternsSet.getQuestions(),
                topic: CategoriesName.patterns.rawValue,
                tag: tag - 1
            )
        case 51:
            SelectedTopic.shared.saveQuestionSet(
                CreationalPatternsSet.getQuestions(),
                topic: CategoriesName.creationalPatterns.rawValue,
                tag: tag - 1
            )
        case 52:
            SelectedTopic.shared.saveQuestionSet(
                StructuralPatternsSet.getQuestions(),
                topic: CategoriesName.structuralPatterns.rawValue,
                tag: tag - 1
            )
        case 53:
            SelectedTopic.shared.saveQuestionSet(
                BehavioralPatternsSet.getQuestions(),
                topic: CategoriesName.behavioralPatterns.rawValue,
                tag: tag - 1
            )
        case 54:
            SelectedTopic.shared.saveQuestionSet(
                AntipatternsSet.getQuestions(),
                topic: CategoriesName.antipatterns.rawValue,
                tag: tag - 1
            )
        case 60:
            SelectedTopic.shared.saveQuestionSet(
                ExtremeProgrammingSet.getQuestions(),
                topic: CategoriesName.extremeProgramming.rawValue,
                tag: tag - 1
            )
        case 61:
            SelectedTopic.shared.saveQuestionSet(
                MobileSecuritySet.getQuestions(),
                topic: CategoriesName.masvs.rawValue,
                tag: tag - 1
            )
        case 62:
            SelectedTopic.shared.saveQuestionSet(
                VCLifecycleSet.getQuestions(),
                topic: CategoriesName.controllerLifecycle.rawValue,
                tag: tag - 1
            )
        case 63:
            SelectedTopic.shared.saveQuestionSet(
                AppLifecycleSet.getQuestions(),
                topic: CategoriesName.appLifecycle.rawValue,
                tag: tag - 1
            )
        case 64:
            SelectedTopic.shared.saveQuestionSet(
                FramesAndBounds.getQuestions(),
                topic: CategoriesName.boundsAndFrame.rawValue,
                tag: tag - 1
            )
        case 65:
            SelectedTopic.shared.saveQuestionSet(
                Multithreading.getQuestions(),
                topic: CategoriesName.multithreading.rawValue,
                tag: tag - 1
            )
        case 66:
            SelectedTopic.shared.saveQuestionSet(
                UIViewSet.getQuestions(),
                topic: CategoriesName.uiview.rawValue,
                tag: tag - 1
            )
        case 67:
            SelectedTopic.shared.saveQuestionSet(
                AutoLayout.getQuestions(),
                topic: CategoriesName.autoLayout.rawValue,
                tag: tag - 1
            )
        case 68:
            SelectedTopic.shared.saveQuestionSet(
                DepenpencyInjection.getQuestions(),
                topic: CategoriesName.dependencyInjection.rawValue,
                tag: tag - 1
            )
        case 69:
            SelectedTopic.shared.saveQuestionSet(
                InversionOfControl.getQuestions(),
                topic: CategoriesName.inversionOfControl.rawValue,
                tag: tag - 1
            )
        case 70:
            SelectedTopic.shared.saveQuestionSet(
                ServiceLocator.getQuestions(),
                topic: CategoriesName.serviceLocator.rawValue,
                tag: tag - 1
            )
        case 71:
            SelectedTopic.shared.saveQuestionSet(
                Networking.getQuestions(),
                topic: CategoriesName.networking.rawValue,
                tag: tag - 1
            )
        case 72:
            SelectedTopic.shared.saveQuestionSet(
                SwiftUIEssentials.getQuestions(),
                topic: CategoriesName.swiftUIEssentials.rawValue,
                tag: tag - 1
            )
        case 73:
            SelectedTopic.shared.saveQuestionSet(
                DrawingAndAnimation.getQuestions(),
                topic: CategoriesName.swiftUIDrawing.rawValue,
                tag: tag - 1
            )
        case 76:
            SelectedTopic.shared.saveQuestionSet(
                APNS.getQuestions(),
                topic: CategoriesName.apns.rawValue,
                tag: tag - 1
            )
        case 78:
            SelectedTopic.shared.saveQuestionSet(
                Interview.getQuestions(),
                topic: CategoriesName.interview.rawValue,
                tag: tag - 1
            )
        case 79:
            SelectedTopic.shared.saveQuestionSet(
                RXSwift.getQuestions(),
                topic: CategoriesName.rxswift.rawValue,
                tag: tag - 1
            )
            
        default:
            allButtons.forEach { button in
                if button.tag - 1 == currentTag {
                    button.layer.borderWidth = Interface.borderWidth
                    button.layer.borderColor = Interface.borderColor
                }
            }
        }
    }
    
    /// Get topic name for button
    private func getTopicName(for tag: Int) -> String {
        switch tag {
        case 1: return CategoriesName.random20.rawValue
        case 2: return CategoriesName.random50.rawValue
        case 3: return CategoriesName.random100.rawValue
        case 4: return CategoriesName.deathMatch.rawValue
            
        case 12: return CategoriesName.basic.rawValue
        case 13: return CategoriesName.integersAndBooleans.rawValue
        case 14: return CategoriesName.basicOperators.rawValue
        case 15: return CategoriesName.rangeOperators.rawValue
        case 16: return CategoriesName.booleanOperators.rawValue
        case 17: return CategoriesName.stringAndCharacters.rawValue
        case 18: return CategoriesName.collections.rawValue
        case 19: return CategoriesName.sets.rawValue
        case 20: return CategoriesName.dictionaries.rawValue
        case 21: return CategoriesName.tuples.rawValue
        case 22: return CategoriesName.controlFlow.rawValue
        case 23: return CategoriesName.optionals.rawValue
        case 24: return CategoriesName.functions.rawValue
        case 25: return CategoriesName.closures.rawValue
        case 26: return CategoriesName.enums.rawValue
        case 27: return CategoriesName.structuresAndClasses.rawValue
        case 28: return CategoriesName.properties.rawValue
        case 29: return CategoriesName.methods.rawValue
        case 30: return CategoriesName.subscripts.rawValue
        case 31: return CategoriesName.inheritance.rawValue
        case 32: return CategoriesName.initialization.rawValue
        case 33: return CategoriesName.deinitialization.rawValue
        case 34: return CategoriesName.errorHandling.rawValue
        case 35: return CategoriesName.concurrency.rawValue
        case 36: return CategoriesName.optionalChaining.rawValue
        case 37: return CategoriesName.arc.rawValue
        case 38: return CategoriesName.typeCasting.rawValue
        case 39: return CategoriesName.nestedTypes.rawValue
        case 40: return CategoriesName.extensions.rawValue
        case 41: return CategoriesName.opaqueType.rawValue
        case 42: return CategoriesName.generics.rawValue
        case 43: return CategoriesName.protocols.rawValue
        case 44: return CategoriesName.accessControl.rawValue
        case 45: return CategoriesName.memorySafety.rawValue
        case 46: return CategoriesName.advancedOperators.rawValue
            
        case 50: return CategoriesName.patterns.rawValue
        case 51: return CategoriesName.creationalPatterns.rawValue
        case 52: return CategoriesName.structuralPatterns.rawValue
        case 53: return CategoriesName.behavioralPatterns.rawValue
        case 54: return CategoriesName.antipatterns.rawValue
            
        case 60: return CategoriesName.extremeProgramming.rawValue
        case 61: return CategoriesName.masvs.rawValue
        case 65: return CategoriesName.multithreading.rawValue
            
        case 62: return CategoriesName.controllerLifecycle.rawValue
        case 63: return CategoriesName.appLifecycle.rawValue
        case 64: return CategoriesName.boundsAndFrame.rawValue
        case 66: return CategoriesName.uiview.rawValue
        case 67: return CategoriesName.autoLayout.rawValue
            
        case 68: return CategoriesName.dependencyInjection.rawValue
        case 69: return CategoriesName.inversionOfControl.rawValue
        case 70: return CategoriesName.serviceLocator.rawValue
            
        case 71: return CategoriesName.networking.rawValue
            
        case 72: return CategoriesName.swiftUIEssentials.rawValue
        case 73: return CategoriesName.swiftUIDrawing.rawValue
            
        case 76: return CategoriesName.apns.rawValue
        case 78: return CategoriesName.interview.rawValue
        case 79: return CategoriesName.rxswift.rawValue
            
        default:
            return ""
        }
    }
}


// MARK: - Как добавлять категории

/// Добавить необходимые кнопки раздела в CategoriesCell.xib
/// Присвоить кнопке tag по порядку
/// Создать outlet-collection с названием раздела или добавить в массив существующего раздела
/// Добавить элементы этой коллекции в общий массив для работы с UI (appendAllButtons)
/// Добавить необходимые действия по этим кнопкам в addQuestionsToArray / topicButtonPressed
/// Добавить новую категорию в RandomSetManager

// MARK: - При добавлении новых "случайных" сетов

/// При добавлении новых сетов с подборками случайных вопросов
/// Добавлять рефреш в refreshRandomSets() внутри GameViewController
/// Это обновляет случайный сет, когда мы его доиграли (чтобы не играть его снова)
