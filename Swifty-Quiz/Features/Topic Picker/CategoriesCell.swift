
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
    static var borderColor = UIColor.darkGray.cgColor
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
        addQuestionsToArray(sender: UIButton())
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
               
                DispatchQueue.main.async {
                    self.addQuestionsToArray(sender: sender)
                    self.delegate?.updateSelectedTopic()
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


// MARK: Работа с UI наших аутлетов
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


// MARK: Выбор категории
extension CategoriesCell {
    func addQuestionsToArray(sender: UIButton) {
        let currentTag = SelectedTopic.shared.topic.topicTag
        
        switch sender.tag {
        case 1:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom20(),
                topic: CategoriesName.random20.rawValue,
                tag: 0
            )
        case 2:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom50(),
                topic: CategoriesName.random50.rawValue,
                tag: 1
            )
        case 3:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom100(),
                topic: CategoriesName.random100.rawValue,
                tag: 2
            )
        case 4:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.deathMatch(),
                topic: CategoriesName.deathMatch.rawValue,
                tag: 3
            )
            
        case 12:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTheBasics(),
                topic: CategoriesName.basic.rawValue,
                tag: 11
            )
        case 13:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getIntegersAndBooleans(),
                topic: CategoriesName.integersAndBooleans.rawValue,
                tag: 12
            )
        case 14:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBasicOperators(),
                topic: CategoriesName.basicOperators.rawValue,
                tag: 13
            )
        case 15:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRangeOperators(),
                topic: CategoriesName.rangeOperators.rawValue,
                tag: 14
            )
        case 16:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBooleanOperators(),
                topic: CategoriesName.booleanOperators.rawValue,
                tag: 15
            )
        case 17:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStringAndCharacters(),
                topic: CategoriesName.stringAndCharacters.rawValue,
                tag: 16
            )
        case 18:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getCollections(),
                topic: CategoriesName.collections.rawValue,
                tag: 17
            )
        case 19:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSets(),
                topic: CategoriesName.sets.rawValue,
                tag: 18
            )
        case 20:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDictionaries(),
                topic: CategoriesName.dictionaries.rawValue,
                tag: 19
            )
        case 21:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTuples(),
                topic: CategoriesName.tuples.rawValue,
                tag: 20
            )
        case 22:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getControlFlow(),
                topic: CategoriesName.controlFlow.rawValue,
                tag: 21
            )
        case 23:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalTypes(),
                topic: CategoriesName.optionals.rawValue,
                tag: 22
            )
        case 24:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getFunctions(),
                topic: CategoriesName.functions.rawValue,
                tag: 23
            )
        case 25:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getClosures(),
                topic: CategoriesName.closures.rawValue,
                tag: 24
            )
        case 26:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getEnums(),
                topic: CategoriesName.enums.rawValue,
                tag: 25
            )
        case 27:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStructuresAndClasses(),
                topic: CategoriesName.structuresAndClasses.rawValue,
                tag: 26
            )
        case 28:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProperties(),
                topic: CategoriesName.properties.rawValue,
                tag: 27
            )
        case 29:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMethods(),
                topic: CategoriesName.methods.rawValue,
                tag: 28
            )
        case 30:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSubscripts(),
                topic: CategoriesName.subscripts.rawValue,
                tag: 29
            )
        case 31:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInheritance(),
                topic: CategoriesName.inheritance.rawValue,
                tag: 30
            )
        case 32:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInitialization(),
                topic: CategoriesName.initialization.rawValue,
                tag: 31
            )
        case 33:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDeinitialization(),
                topic: CategoriesName.deinitialization.rawValue,
                tag: 32
            )
        case 34:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getErrorHandling(),
                topic: CategoriesName.errorHandling.rawValue,
                tag: 33
            )
        case 35:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getConcurrency(),
                topic: CategoriesName.concurrency.rawValue,
                tag: 34
            )
        case 36:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalChaining(),
                topic: CategoriesName.optionalChaining.rawValue,
                tag: 35
            )
        case 37:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getARC(),
                topic: CategoriesName.arc.rawValue,
                tag: 36
            )
        case 38:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTypeCasting(),
                topic: CategoriesName.typeCasting.rawValue,
                tag: 37
            )
        case 39:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getNestedTypes(),
                topic: CategoriesName.nestedTypes.rawValue,
                tag: 38
            )
        case 40:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getExtensions(),
                topic: CategoriesName.extensions.rawValue,
                tag: 39
            )
        case 41:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOpaqueTypes(),
                topic: CategoriesName.opaqueType.rawValue,
                tag: 40
            )
        case 42:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getGenerics(),
                topic: CategoriesName.generics.rawValue,
                tag: 41
            )
        case 43:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProtocols(),
                topic: CategoriesName.protocols.rawValue,
                tag: 42
            )
        case 44:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAccessControl(),
                topic: CategoriesName.accessControl.rawValue,
                tag: 43
            )
        case 45:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMemorySafety(),
                topic: CategoriesName.memorySafety.rawValue,
                tag: 44
            )
        case 46:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAdvancedOperators(),
                topic: CategoriesName.advancedOperators.rawValue,
                tag: 45
            )
            
            
        case 50:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsBasicsAboutPatterns(),
                topic: CategoriesName.patterns.rawValue,
                tag: 49
            )
        case 51:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsCreationalPatterns(),
                topic: CategoriesName.creationalPatterns.rawValue,
                tag: 50
            )
        case 52:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsStructuralPatterns(),
                topic: CategoriesName.structuralPatterns.rawValue,
                tag: 51
            )
        case 53:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsBehavioralPatterns(),
                topic: "Поведенческие паттерны",
                tag: 52
            )
        case 54:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAntipatterns(),
                topic: CategoriesName.antipatterns.rawValue,
                tag: 53
            )
        
            
        case 60:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsExtremeProgramming(),
                topic: CategoriesName.extremeProgramming.rawValue,
                tag: 59
            )
        case 61:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMobileSecurity(),
                topic: CategoriesName.masvs.rawValue,
                tag: 60
            )
        case 62:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsLifecycle(),
                topic: CategoriesName.controllerLifecycle.rawValue,
                tag: 61
            )
        case 63:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAppLifecycle(),
                topic: CategoriesName.appLifecycle.rawValue,
                tag: 62
            )
        case 64:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsFramesAndBounds(),
                topic: CategoriesName.boundsAndFrame.rawValue,
                tag: 63
            )
        case 65:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMultithreading(),
                topic: CategoriesName.multithreading.rawValue,
                tag: 64
            )
        case 66:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsUIViewSet(),
                topic: CategoriesName.uiview.rawValue,
                tag: 65
            )
        case 67:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAutoLayout(),
                topic: CategoriesName.autoLayout.rawValue,
                tag: 66
            )
        case 68:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsDependencyInjection(),
                topic: CategoriesName.dependencyInjection.rawValue,
                tag: 67
            )
        case 69:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsInversionOfControl(),
                topic: CategoriesName.inversionOfControl.rawValue,
                tag: 68
            )
        case 70:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsServiceLocator(),
                topic: CategoriesName.serviceLocator.rawValue,
                tag: 69
            )
        case 71:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsNetworking(),
                topic: CategoriesName.networking.rawValue,
                tag: 70
            )
        case 72:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSwiftUIEssentials(),
                topic: CategoriesName.swiftUIEssentials.rawValue,
                tag: 71
            )
        case 73:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSwiftUIDrawing(),
                topic: CategoriesName.swiftUIDrawing.rawValue,
                tag: 72
            )
        case 74:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSwiftUIDesign(),
                topic: CategoriesName.swiftUILayout.rawValue,
                tag: 73
            )
        case 75:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSwiftUIFrameworks(),
                topic: CategoriesName.swiftUIFrameworks.rawValue,
                tag: 74
            )
        case 76:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAPNS(),
                topic: CategoriesName.apns.rawValue,
                tag: 75
            )
        case 77:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getFCM(),
                topic: CategoriesName.fcm.rawValue,
                tag: 76
            )
        case 78:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInterview(),
                topic: CategoriesName.interview.rawValue,
                tag: 77
            )
        case 79:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRXSwift(),
                topic: CategoriesName.rxswift.rawValue,
                tag: 78
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
        case 74: return CategoriesName.swiftUILayout.rawValue
        case 75: return CategoriesName.swiftUIFrameworks.rawValue
            
        case 76: return CategoriesName.apns.rawValue
        case 77: return CategoriesName.fcm.rawValue
        case 78: return CategoriesName.interview.rawValue
        case 79: return CategoriesName.rxswift.rawValue
            
        default:
            return ""
        }
    }
}


// MARK: Как добавлять категории
/// Добавить необходимые кнопки раздела в CategoriesCell.xib
/// Присвоить кнопке tag по порядку
/// Создать outlet-collection с названием раздела или добавить в массив существующего раздела
/// Добавить элементы этой коллекции в общий массив для работы с UI (appendAllButtons)
/// Добавить необходимые действия по этим кнопкам в addQuestionsToArray / topicButtonPressed
/// Добавить новую категорию в RandomSetManager

// MARK: При добавлении новых "случайных" сетов
/// При добавлении новых сетов с подборками случайных вопросов
/// Добавлять рефреш в refreshRandomSets() внутри GameViewController
/// Это обновляет случайный сет, когда мы его доиграли (чтобы не играть его снова)
