
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class CategoriesCell: UITableViewCell {
    
    @IBOutlet weak var basicsNumberOfQuestion: UILabel!
    @IBOutlet var topicButtonOutlets: [HalfRoundButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
    }
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTopicButtons() {
        for i in 0..<topicButtonOutlets.count {
            topicButtonOutlets[i].setTitleColor(.black, for: .normal)
            topicButtonOutlets[i].backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        }
    }
    
    func setFontSize() {
        for button in topicButtonOutlets {
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
        
        switch sender.tag {
            
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
        case 21:
            newQuestionSet = TopicOperator.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 20)
            
            
        // MARK:  09 row
        case 22:
            newQuestionSet = TopicOperator.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 21)
        case 23:
            newQuestionSet = TopicOperator.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 22)
            
            
        // MARK:  10 row
        case 24:
            newQuestionSet = TopicOperator.getQuestionsAccessControl()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 23)
        case 25:
            newQuestionSet = TopicOperator.getQuestionsMemorySafety()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 24)
            
            
         // MARK:  11 row
         case 26:
             newQuestionSet = TopicOperator.getQuestionsAdvancedOperators()
             SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 25)
             
         
        default:
            /// Последнюю выбранную категорию делаем "активной"
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].setTitleColor(.white, for: .normal)
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
        }
        
        basicsNumberOfQuestion.text = "Количество вопросов категории: \(newQuestionSet.count)"
    }
}
