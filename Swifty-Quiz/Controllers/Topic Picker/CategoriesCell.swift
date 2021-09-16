
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

// MARK: Как добавлять категории
/// - Добавить необходимые кнопки раздела в CategoriesCell.xib
/// - Присвоить кнопке tag по порядку
/// - Создать outlet-collection с названием раздела или добавить в массив существующего раздела
/// - Добавить элементы этой коллекции в общий массив для работы с UI (функция unificationOfOutlets)
/// - Добавить необходимые действия по этим кнопкам в addQuestionsToArray
/// - Добавить новую категорию в RandomSetManager

// MARK: При добавлении новых "случайных" сетов
/// При добавлении новых сетов с подборками случайных вопросов
/// Добавлять рефреш в refreshRandomSets() внутри GameViewController
/// Это обновляет случайный сет, когда мы его доиграли (чтобы не играть его снова)

import UIKit

protocol CategoriesCellDelegate: AnyObject {
    func updateNumberOfQuestions()
    func showAlert()
}

class CategoriesCell: UITableViewCell {
    
    var allButtons: [UIButton] = []
    
    @IBOutlet var random: [UIButton]!
    @IBOutlet var guide: [UIButton]!
    @IBOutlet var patterns: [UIButton]!
    @IBOutlet var other: [UIButton]!
    
    weak var delegate: CategoriesCellDelegate?
    
    private var currentPosition = SelectedTopic.shared.topic.topicTag
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appendAllButtons()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
        addShadows()
    }

    override func layoutSubviews() {
        delegate?.showAlert()
    }

    @IBAction func topicButtonPressed(_ sender: UIButton) {
        DispatchQueue.main.async {
            if sender.tag - 1 != self.currentPosition {
                self.updateTopicButtons()
                sender.backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
                SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
                self.addQuestionsToArray(sender: sender)
                self.delegate?.updateNumberOfQuestions()
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
        allButtons.append(contentsOf: other)
    }
    
    /// Добавляем тени кнопкам
    func addShadows() {
        DispatchQueue.main.async {
            Shadow().addTopicButtonShadows(self.allButtons)
        }
    }
    
    /// Рефреш кнопок
    func updateTopicButtons() {
        allButtons.forEach() { button in
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
                topic: "20 случайных вопросов",
                tag: 0
            )
        case 2:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom50(),
                topic: "50 случайных вопросов",
                tag: 1
            )
        case 3:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRandom100(),
                topic: "100 случайных вопросов",
                tag: 2
            )
        case 4:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.deathMatch(),
                topic: "The Death Match",
                tag: 3
            )
            
            
        // MARK: THE BASICS
    
        case 12:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTheBasics(),
                topic: "Основы",
                tag: 11
            )
        case 13:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getIntegersAndBooleans(),
                topic: "Числовые и логические типы",
                tag: 12
            )
        case 14:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBasicOperators(),
                topic: "Базовые операторы",
                tag: 13
            )
        case 15:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getRangeOperators(),
                topic: "Операторы диапазона",
                tag: 14
            )
        case 16:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getBooleanOperators(),
                topic: "Логические операторы",
                tag: 15
            )
        case 17:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStringAndCharacters(),
                topic: "Строки и символы",
                tag: 16
            )
        case 18:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getCollections(),
                topic: "Коллекции, массивы",
                tag: 17
            )
        case 19:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSets(),
                topic: "Множества",
                tag: 18
            )
        case 20:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDictionaries(),
                topic: "Словари",
                tag: 19
            )
        case 21:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTuples(),
                topic: "Кортежи",
                tag: 20
            )
        case 22:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getControlFlow(),
                topic: "Управление потоком",
                tag: 21
            )
        case 23:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalTypes(),
                topic: "Опциональные типы",
                tag: 22
            )
        case 24:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getFunctions(),
                topic: "Функции",
                tag: 23
            )
        case 25:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getClosures(),
                topic: "Замыкания",
                tag: 24
            )
        case 26:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getEnums(),
                topic: "Перечисления",
                tag: 25
            )
        case 27:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getStructuresAndClasses(),
                topic: "Структуры и классы",
                tag: 26
            )
        case 28:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProperties(),
                topic: "Свойства",
                tag: 27
            )
        case 29:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMethods(),
                topic: "Методы",
                tag: 28
            )
        case 30:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getSubscripts(),
                topic: "Сабскрипты",
                tag: 29
            )
        case 31:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInheritance(),
                topic: "Наследование",
                tag: 30
            )
        case 32:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getInitialization(),
                topic: "Инициализация",
                tag: 31
            )
        case 33:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getDeinitialization(),
                topic: "Деинициализация",
                tag: 32
            )
        case 34:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getErrorHandling(),
                topic: "Обработка ошибок",
                tag: 33
            )
        case 35:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getConcurrency(),
                topic: "Согласованность",
                tag: 34
            )
        case 36:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOptionalChaining(),
                topic: "Опциональная последовательность",
                tag: 35
            )
        case 37:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getARC(),
                topic: "Автоматический подсчет ссылок",
                tag: 36
            )
        case 38:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getTypeCasting(),
                topic: "Приведение типов",
                tag: 37
            )
        case 39:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getNestedTypes(),
                topic: "Вложенные типы",
                tag: 38
            )
        case 40:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getExtensions(),
                topic: "Расширения",
                tag: 39
            )
        case 41:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getOpaqueTypes(),
                topic: "Непрозрачные типы",
                tag: 40
            )
        case 42:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getGenerics(),
                topic: "Универсальные шаблоны",
                tag: 41
            )
        case 43:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getProtocols(),
                topic: "Протоколы",
                tag: 42
            )
        case 44:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAccessControl(),
                topic: "Контроль доступа",
                tag: 43
            )
        case 45:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getMemorySafety(),
                topic: "Безопасность хранения",
                tag: 44
            )
        case 46:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getAdvancedOperators(),
                topic: "Продвинутые операторы",
                tag: 45
            )
             
            
        // MARK: PATTERNS
         
        case 50:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsBasicsAboutPatterns(),
                topic: "Паттерны: Общие вопросы",
                tag: 49
            )
        case 51:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsCreationalPatterns(),
                topic: "Порождающие паттерны",
                tag: 50
            )
        case 52:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsStructuralPatterns(),
                topic: "Структурные паттерны",
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
                topic: "Антипаттерны",
                tag: 53
            )
        
            
        // MARK: OTHER
        
        case 60:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsExtremeProgramming(),
                topic: "Экстремальное программирование",
                tag: 59
            )
        case 61:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMobileSecurity(),
                topic: "MASVS - Мобильная безопасность",
                tag: 60
            )
        case 62:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsLifecycle(),
                topic: "ViewController Lifecycle",
                tag: 61
            )
        case 63:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsAppLifecycle(),
                topic: "App Lifecycle",
                tag: 62
            )
        case 64:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsFramesAndBounds(),
                topic: "Frames & Bounds",
                tag: 63
            )
        case 65:
            SelectedTopic.shared.saveQuestionSet(
                TopicOperator.getQuestionsMultithreading(),
                topic: "Многопоточность",
                tag: 64
            )
            
        default:
            allButtons.forEach { button in
                button.backgroundColor = button.tag - 1 == currentTag ? #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}
