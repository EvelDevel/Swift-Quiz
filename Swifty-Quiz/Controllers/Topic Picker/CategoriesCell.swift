
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

// MARK: Как добавлять категории
/// Добавить необходимые кнопки раздела в CategoriesCell.xib
/// Присвоить кнопке tag по порядку
/// Создать outlet-collection с названием раздела или добавить в массив существующего раздела
/// Добавить элементы этой коллекции в общий массив для работы с UI (функция unificationOfOutlets)
/// Добавить необходимые действия по этим кнопкам в addQuestionsToArray / topicButtonPressed
/// Добавить новую категорию в RandomSetManager

// MARK: При добавлении новых "случайных" сетов
/// При добавлении новых сетов с подборками случайных вопросов
/// Добавлять рефреш в refreshRandomSets() внутри GameViewController
/// Это обновляет случайный сет, когда мы его доиграли (чтобы не играть его снова)

import UIKit

protocol CategoriesCellDelegate: AnyObject {
    func updateNumberOfQuestions()
    func updateSuccessRate(rate: Int)
    func removeSuccessRateLabel()
    func showAlert()
}

private class Interface {
    static var borderWidth = 1.0
    static var borderColor = UIColor.darkGray.cgColor
}

class CategoriesCell: UITableViewCell {
    
    var allButtons: [UIButton] = []
    
    @IBOutlet private var random: [UIButton]!
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
            button.layer.backgroundColor = progress.getProgressColor(
                for: getTopicName(for: button.tag)
            )
            button.layer.borderWidth = 0
            
            if button.layer.backgroundColor?.alpha ?? 0 >= 0.75
                && button.layer.backgroundColor != UIColor.white.cgColor {
                
            }
        }
    }
    
    @IBAction private func topicButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if sender.tag - 1 != self.currentPosition {
                
                self.setupProgressToButtons()
                sender.layer.borderWidth = Interface.borderWidth
                sender.layer.borderColor = Interface.borderColor
                
                SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
                self.addQuestionsToArray(sender: sender)
                
                self.delegate?.updateNumberOfQuestions()
                
                if sender.tag > 10 {
                    self.delegate?.updateSuccessRate(
                        rate: self.progress.getProgressCounter(
                            for: self.getTopicName(
                                for: sender.tag))
                    )
                } else {
                    self.delegate?.removeSuccessRateLabel()
                }
                
                Game.shared.changeContinueStatus()
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
                topic: CategoriesNames.random20.rawValue,
                tag: 0
            )
        case 2:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom50(),
                topic: CategoriesNames.random50.rawValue,
                tag: 1
            )
        case 3:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom100(),
                topic: CategoriesNames.random100.rawValue,
                tag: 2
            )
        case 4:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.deathMatch(),
                topic: CategoriesNames.deathMatch.rawValue,
                tag: 3
            )
            
            
        case 12:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTheBasics(),
                topic: CategoriesNames.basic.rawValue,
                tag: 11
            )
        case 13:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getIntegersAndBooleans(),
                topic: CategoriesNames.integersAndBooleans.rawValue,
                tag: 12
            )
        case 14:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBasicOperators(),
                topic: CategoriesNames.basicOperators.rawValue,
                tag: 13
            )
        case 15:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRangeOperators(),
                topic: CategoriesNames.rangeOperators.rawValue,
                tag: 14
            )
        case 16:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBooleanOperators(),
                topic: CategoriesNames.booleanOperators.rawValue,
                tag: 15
            )
        case 17:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStringAndCharacters(),
                topic: CategoriesNames.stringAndCharacters.rawValue,
                tag: 16
            )
        case 18:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getCollections(),
                topic: CategoriesNames.collections.rawValue,
                tag: 17
            )
        case 19:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSets(),
                topic: CategoriesNames.sets.rawValue,
                tag: 18
            )
        case 20:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDictionaries(),
                topic: CategoriesNames.dictionaries.rawValue,
                tag: 19
            )
        case 21:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTuples(),
                topic: CategoriesNames.tuples.rawValue,
                tag: 20
            )
        case 22:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getControlFlow(),
                topic: CategoriesNames.controlFlow.rawValue,
                tag: 21
            )
        case 23:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalTypes(),
                topic: CategoriesNames.optionals.rawValue,
                tag: 22
            )
        case 24:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getFunctions(),
                topic: CategoriesNames.functions.rawValue,
                tag: 23
            )
        case 25:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getClosures(),
                topic: CategoriesNames.closures.rawValue,
                tag: 24
            )
        case 26:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getEnums(),
                topic: CategoriesNames.enums.rawValue,
                tag: 25
            )
        case 27:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStructuresAndClasses(),
                topic: CategoriesNames.structuresAndClasses.rawValue,
                tag: 26
            )
        case 28:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProperties(),
                topic: CategoriesNames.properties.rawValue,
                tag: 27
            )
        case 29:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMethods(),
                topic: CategoriesNames.methods.rawValue,
                tag: 28
            )
        case 30:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSubscripts(),
                topic: CategoriesNames.subscripts.rawValue,
                tag: 29
            )
        case 31:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInheritance(),
                topic: CategoriesNames.inheritance.rawValue,
                tag: 30
            )
        case 32:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInitialization(),
                topic: CategoriesNames.initialization.rawValue,
                tag: 31
            )
        case 33:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDeinitialization(),
                topic: CategoriesNames.deinitialization.rawValue,
                tag: 32
            )
        case 34:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getErrorHandling(),
                topic: CategoriesNames.errorHandling.rawValue,
                tag: 33
            )
        case 35:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getConcurrency(),
                topic: CategoriesNames.concurrency.rawValue,
                tag: 34
            )
        case 36:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalChaining(),
                topic: CategoriesNames.optionalChaining.rawValue,
                tag: 35
            )
        case 37:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getARC(),
                topic: CategoriesNames.arc.rawValue,
                tag: 36
            )
        case 38:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTypeCasting(),
                topic: CategoriesNames.typeCasting.rawValue,
                tag: 37
            )
        case 39:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getNestedTypes(),
                topic: CategoriesNames.nestedTypes.rawValue,
                tag: 38
            )
        case 40:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getExtensions(),
                topic: CategoriesNames.extensions.rawValue,
                tag: 39
            )
        case 41:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOpaqueTypes(),
                topic: CategoriesNames.opaqueType.rawValue,
                tag: 40
            )
        case 42:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getGenerics(),
                topic: CategoriesNames.generics.rawValue,
                tag: 41
            )
        case 43:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProtocols(),
                topic: CategoriesNames.protocols.rawValue,
                tag: 42
            )
        case 44:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAccessControl(),
                topic: CategoriesNames.accessControl.rawValue,
                tag: 43
            )
        case 45:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMemorySafety(),
                topic: CategoriesNames.memorySafety.rawValue,
                tag: 44
            )
        case 46:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAdvancedOperators(),
                topic: CategoriesNames.advancedOperators.rawValue,
                tag: 45
            )
            
            
        case 50:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsBasicsAboutPatterns(),
                topic: CategoriesNames.patterns.rawValue,
                tag: 49
            )
        case 51:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsCreationalPatterns(),
                topic: CategoriesNames.creationalPatterns.rawValue,
                tag: 50
            )
        case 52:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsStructuralPatterns(),
                topic: CategoriesNames.structuralPatterns.rawValue,
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
                topic: CategoriesNames.antipatterns.rawValue,
                tag: 53
            )
        
            
        case 60:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsExtremeProgramming(),
                topic: CategoriesNames.extremeProgramming.rawValue,
                tag: 59
            )
        case 61:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMobileSecurity(),
                topic: CategoriesNames.masvs.rawValue,
                tag: 60
            )
        case 62:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsLifecycle(),
                topic: CategoriesNames.controllerLifecycle.rawValue,
                tag: 61
            )
        case 63:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAppLifecycle(),
                topic: CategoriesNames.appLifecycle.rawValue,
                tag: 62
            )
        case 64:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsFramesAndBounds(),
                topic: CategoriesNames.boundsAndFrame.rawValue,
                tag: 63
            )
        case 65:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMultithreading(),
                topic: CategoriesNames.multithreading.rawValue,
                tag: 64
            )
        case 66:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsUIViewSet(),
                topic: CategoriesNames.uiview.rawValue,
                tag: 65
            )
        case 67:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAutoLayout(),
                topic: CategoriesNames.autoLayout.rawValue,
                tag: 66
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
        case 1: return CategoriesNames.random20.rawValue
        case 2: return CategoriesNames.random50.rawValue
        case 3: return CategoriesNames.random100.rawValue
        case 4: return CategoriesNames.deathMatch.rawValue
            
        case 12: return CategoriesNames.basic.rawValue
        case 13: return CategoriesNames.integersAndBooleans.rawValue
        case 14: return CategoriesNames.basicOperators.rawValue
        case 15: return CategoriesNames.rangeOperators.rawValue
        case 16: return CategoriesNames.booleanOperators.rawValue
        case 17: return CategoriesNames.stringAndCharacters.rawValue
        case 18: return CategoriesNames.collections.rawValue
        case 19: return CategoriesNames.sets.rawValue
        case 20: return CategoriesNames.dictionaries.rawValue
        case 21: return CategoriesNames.tuples.rawValue
        case 22: return CategoriesNames.controlFlow.rawValue
        case 23: return CategoriesNames.optionals.rawValue
        case 24: return CategoriesNames.functions.rawValue
        case 25: return CategoriesNames.closures.rawValue
        case 26: return CategoriesNames.enums.rawValue
        case 27: return CategoriesNames.structuresAndClasses.rawValue
        case 28: return CategoriesNames.properties.rawValue
        case 29: return CategoriesNames.methods.rawValue
        case 30: return CategoriesNames.subscripts.rawValue
        case 31: return CategoriesNames.inheritance.rawValue
        case 32: return CategoriesNames.initialization.rawValue
        case 33: return CategoriesNames.deinitialization.rawValue
        case 34: return CategoriesNames.errorHandling.rawValue
        case 35: return CategoriesNames.concurrency.rawValue
        case 36: return CategoriesNames.optionalChaining.rawValue
        case 37: return CategoriesNames.arc.rawValue
        case 38: return CategoriesNames.typeCasting.rawValue
        case 39: return CategoriesNames.nestedTypes.rawValue
        case 40: return CategoriesNames.extensions.rawValue
        case 41: return CategoriesNames.opaqueType.rawValue
        case 42: return CategoriesNames.generics.rawValue
        case 43: return CategoriesNames.protocols.rawValue
        case 44: return CategoriesNames.accessControl.rawValue
        case 45: return CategoriesNames.memorySafety.rawValue
        case 46: return CategoriesNames.advancedOperators.rawValue
            
        case 50: return CategoriesNames.patterns.rawValue
        case 51: return CategoriesNames.creationalPatterns.rawValue
        case 52: return CategoriesNames.structuralPatterns.rawValue
        case 53: return CategoriesNames.behavioralPatterns.rawValue
        case 54: return CategoriesNames.antipatterns.rawValue
            
        case 60: return CategoriesNames.extremeProgramming.rawValue
        case 61: return CategoriesNames.masvs.rawValue
        case 65: return CategoriesNames.multithreading.rawValue
            
        case 62: return CategoriesNames.controllerLifecycle.rawValue
        case 63: return CategoriesNames.appLifecycle.rawValue
        case 64: return CategoriesNames.boundsAndFrame.rawValue
        case 66: return CategoriesNames.uiview.rawValue
        case 67: return CategoriesNames.autoLayout.rawValue
            
        default:
            return ""
        }
    }
}
