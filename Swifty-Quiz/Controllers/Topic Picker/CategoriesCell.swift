
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol CategoriesCellDelegate: class {
    func updateNumberOfQuestions()
    func showAlert()
}

class CategoriesCell: UITableViewCell {

    @IBOutlet var allButtons: [UIButton]!
    weak var delegate: CategoriesCellDelegate?
    private let shadows = ShadowsHelper()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
        addShadows()
    }
    
    override func layoutSubviews() {
        delegate?.showAlert()
    }
    
    func addShadows() {
        /// На некоторых экранах тень под кнопкой не ресайзится (7, XR, 6s, 8)
        /// DispatchQueue является решением данного бага в нашем случае
        /// https://stackoverflow.com/questions/49664951/shadow-effect-is-not-displaying-properly-for-uiview
        DispatchQueue.main.async {
            self.shadows.addTopicButtonShadows(self.allButtons)
        }
    }
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        delegate?.updateNumberOfQuestions()
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
        Game.shared.changeContinueStatus()
        sender.backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTopicButtons() {
        for i in 0..<self.allButtons.count {
            self.allButtons[i].setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            self.allButtons[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    func setFontSize() {
        for button in allButtons {
            if UIScreen.main.bounds.size.width > 320 {
                button.titleLabel?.font =  .systemFont(ofSize: 12)
            } else {
                button.titleLabel?.font =  .systemFont(ofSize: 10)
            }
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
            
            
            // MARK: THE BASICS
            
        // MARK: 01 row
        case 1:
            newQuestionSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Основы", tag: 0)
        case 2:
            newQuestionSet = TopicOperator.getQuestionsBasicOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 1)
        case 3:
            newQuestionSet = TopicOperator.getQuestionsStringAndCharacters()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Строки и символы", tag: 2)
            
        // MARK: 02 row
        case 4:
            newQuestionSet = TopicOperator.getQuestionsCollectionTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы коллекций", tag: 3)
        case 5:
            newQuestionSet = TopicOperator.getQuestionsControlFlow()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Управление потоком", tag: 4)
            
        // MARK: 03 row
        case 6:
            newQuestionSet = TopicOperator.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции", tag: 5)
        case 7:
            newQuestionSet = TopicOperator.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания", tag: 6)
        case 8:
            newQuestionSet = TopicOperator.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления", tag: 7)
            
        // MARK: 04 row
        case 9:
            newQuestionSet = TopicOperator.getQuestionsStructuresAndClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры и классы", tag: 8)
        case 10:
            newQuestionSet = TopicOperator.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства", tag: 9)
        case 11:
            newQuestionSet = TopicOperator.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы", tag: 10)
            
        // MARK: 05 row
        case 12:
            newQuestionSet = TopicOperator.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 11)
        case 13:
            newQuestionSet = TopicOperator.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование", tag: 12)
        case 14:
            newQuestionSet = TopicOperator.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация", tag: 13)
            
        // MARK:  06 row
        case 15:
            newQuestionSet = TopicOperator.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 14)
        case 16:
            newQuestionSet = TopicOperator.getQuestionsErrorHandling()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 15)
            
        // MARK:  07 row
        case 17:
            newQuestionSet = TopicOperator.getQuestionsOptionalChaining()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опциональная последовательность", tag: 16)
        case 18:
            newQuestionSet = TopicOperator.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC", tag: 17)
            
        // MARK:  08 row
        case 19:
            newQuestionSet = TopicOperator.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 18)
        case 20:
            newQuestionSet = TopicOperator.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 19)
            
        // MARK:  09 row
        case 21:
            newQuestionSet = TopicOperator.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 20)
        case 22:
            newQuestionSet = TopicOperator.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 21)
            
        // MARK:  10 row
        case 23:
            newQuestionSet = TopicOperator.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 22)
        case 24:
            newQuestionSet = TopicOperator.getQuestionsAccessControl()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 23)
            
        // MARK:  11 row
        case 25:
            newQuestionSet = TopicOperator.getQuestionsMemorySafety()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 24)
        case 26:
            newQuestionSet = TopicOperator.getQuestionsAdvancedOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 25)
             
            
            // MARK: PATTERNS
            
        // MARK: 01 row
        case 27:
            newQuestionSet = TopicOperator.getQuestionsBasicPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Базовые паттерны", tag: 26)
        case 28:
            newQuestionSet = TopicOperator.getQuestionsAdvancedPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые паттерны", tag: 27)
            
            
        // MARK: 02 row
        case 29:
            newQuestionSet = TopicOperator.getQuestionsArchitecturalPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Архитектурные паттерны", tag: 28)
        case 30:
            newQuestionSet = TopicOperator.getQuestionsAntipatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Антипаттерны", tag: 29)
            
        default:
            /// Последнюю выбранную категорию делаем "активной"
            allButtons[position].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
        }
    }
}
