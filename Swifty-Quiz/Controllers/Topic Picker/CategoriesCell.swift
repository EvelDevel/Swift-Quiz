
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

// MARK: Как добавлять категории
/// 1. Добавить необходимые кнопки раздела в xib-файле
/// 2. Создать outlet-collection с названием раздела
/// 3. Присвоить этим кнопкам свои tag (по порядку)
/// 4. Добавить элементы этой коллекции в общий массив для работы с UI (функция unificationOfOutlets)
/// 5. Добавить необходимые действия по этим кнопкам в addQuestionsToArray
/// 6. Внутри addQuestionsToArray, в кейсе default - прописать нужный кейс и диапазон
///  - отнимать tag предыдущей, последней кнопки (например, следующим будет [position-39])

import UIKit

protocol CategoriesCellDelegate: class {
    func updateNumberOfQuestions()
    func showAlert()
}

class CategoriesCell: UITableViewCell {
    
    /// Коллекции кнопок, разбиты по разделам,
    /// Так не нужно переделывать один массив при каждом изменении любой кнопки
    var allOutlets: [UIButton] = []
    @IBOutlet var superSets: [UIButton]!
    @IBOutlet var guideQuestions: [UIButton]!
    @IBOutlet var patternsQuestions: [UIButton]!

    weak var delegate: CategoriesCellDelegate?
    private let shadows = ShadowsHelper()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        unificationOfOutlets()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
        addShadows()
    }
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        delegate?.updateNumberOfQuestions()
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
        Game.shared.changeContinueStatus()
        sender.backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
    }
    
    override func layoutSubviews() {
        delegate?.showAlert()
    }
}


// MARK: Работа с UI наших аутлетов
extension CategoriesCell {
    
    /// Объединяем аутлеты в пачку
    func unificationOfOutlets() {
        allOutlets.append(contentsOf: superSets)
        allOutlets.append(contentsOf: guideQuestions)
        allOutlets.append(contentsOf: patternsQuestions)
    }
    
    /// Добавляем тени кнопкам
    /// - На некоторых экранах тень под кнопкой не ресайзится (7, XR, 6s, 8)
    /// - DispatchQueue является решением данного бага в нашем случае
    /// - https://stackoverflow.com/questions/49664951/shadow-effect-is-not-displaying-properly-for-uiview
    func addShadows() {
        DispatchQueue.main.async {
            self.shadows.addTopicButtonShadows(self.allOutlets)
        }
    }
    
    /// Рефреш кнопок
    func updateTopicButtons() {
        allOutlets.forEach() { button in
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    /// Размер шрифта
    /// Зависящий от размера экрана
    func setFontSize() {
        allOutlets.forEach() { button in
            if UIScreen.main.bounds.size.width > 320 { button.titleLabel?.font = .systemFont(ofSize: 12)
            } else { button.titleLabel?.font = .systemFont(ofSize: 10) }
        }
    }
}


// MARK: Выбор категории
extension CategoriesCell {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        var newQuestionSet: [Question] = SelectedTopic.shared.topic.questionSet
        let position = SelectedTopic.shared.topic.topicTag
        
        switch sender.tag {
            
            // MARK: SUPER SETS
            
        // MARK: 01 row
        case 1:
            newQuestionSet = TopicOperator.getQuestionsAllGuide()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Руководство", tag: 0)
        case 2:
            newQuestionSet = TopicOperator.getQuestionsAllPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны", tag: 1)
            
            
            // MARK: THE BASICS
            
        // MARK: 01 row
        case 11:
            newQuestionSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Основы", tag: 10)
        case 12:
            newQuestionSet = TopicOperator.getQuestionsBasicOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 11)
        case 13:
            newQuestionSet = TopicOperator.getQuestionsStringAndCharacters()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Строки и символы", tag: 12)
            
        // MARK: 02 row
        case 14:
            newQuestionSet = TopicOperator.getQuestionsCollectionTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы коллекций", tag: 13)
        case 15:
            newQuestionSet = TopicOperator.getQuestionsControlFlow()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Управление потоком", tag: 14)
            
        // MARK: 03 row
        case 16:
            newQuestionSet = TopicOperator.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции", tag: 15)
        case 17:
            newQuestionSet = TopicOperator.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания", tag: 16)
        case 18:
            newQuestionSet = TopicOperator.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления", tag: 17)
            
        // MARK: 04 row
        case 19:
            newQuestionSet = TopicOperator.getQuestionsStructuresAndClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры и классы", tag: 18)
        case 20:
            newQuestionSet = TopicOperator.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства", tag: 19)
        case 21:
            newQuestionSet = TopicOperator.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы", tag: 20)
            
        // MARK: 05 row
        case 22:
            newQuestionSet = TopicOperator.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 21)
        case 23:
            newQuestionSet = TopicOperator.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование", tag: 22)
        case 24:
            newQuestionSet = TopicOperator.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация", tag: 23)
            
        // MARK:  06 row
        case 25:
            newQuestionSet = TopicOperator.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 24)
        case 26:
            newQuestionSet = TopicOperator.getQuestionsErrorHandling()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 25)
            
        // MARK:  07 row
        case 27:
            newQuestionSet = TopicOperator.getQuestionsOptionalChaining()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опциональная последовательность", tag: 26)
        case 28:
            newQuestionSet = TopicOperator.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC", tag: 27)
            
        // MARK:  08 row
        case 29:
            newQuestionSet = TopicOperator.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 28)
        case 30:
            newQuestionSet = TopicOperator.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 29)
            
        // MARK:  09 row
        case 31:
            newQuestionSet = TopicOperator.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 30)
        case 32:
            newQuestionSet = TopicOperator.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 31)
            
        // MARK:  10 row
        case 33:
            newQuestionSet = TopicOperator.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 32)
        case 34:
            newQuestionSet = TopicOperator.getQuestionsAccessControl()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 33)
            
        // MARK:  11 row
        case 35:
            newQuestionSet = TopicOperator.getQuestionsMemorySafety()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 34)
        case 36:
            newQuestionSet = TopicOperator.getQuestionsAdvancedOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 35)
             
            
            // MARK: PATTERNS
            
        // MARK: 01 row
        case 37:
            newQuestionSet = TopicOperator.getQuestionsBasicPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Базовые паттерны", tag: 36)
        case 38:
            newQuestionSet = TopicOperator.getQuestionsAdvancedPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые паттерны", tag: 37)
            
        // MARK: 02 row
        case 39:
            newQuestionSet = TopicOperator.getQuestionsArchitecturalPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Архитектурные паттерны", tag: 38)
        case 40:
            newQuestionSet = TopicOperator.getQuestionsAntipatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Антипаттерны", tag: 39)
        
            
        default:
            /// Последнюю выбранную категорию делаем "активной"
            switch position {
            case 0...9:
                superSets[position].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            case 10...35:
                guideQuestions[position-10].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            case 36...39:
                patternsQuestions[position-36].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            default:
                print("default case in addQuestionsToArray() in CategoriesCell")
            }
        }
    }
}
