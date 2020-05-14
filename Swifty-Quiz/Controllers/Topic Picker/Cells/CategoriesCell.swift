
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class CategoriesCell: UITableViewCell {

    @IBOutlet weak var basicsNumberOfQuestion: UILabel!
    @IBOutlet var topicButtonOutlets: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addQuestionsToArray(sender: UIButton())
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
}


// MARK: Обнуляем кнопки
extension CategoriesCell {
    
    func updateTopicButtons() {
        for i in 0..<topicButtonOutlets.count {
            topicButtonOutlets[i].setTitleColor(.black, for: .normal)
            topicButtonOutlets[i].backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        }
    }
}

// MARK: Выбор категории
extension CategoriesCell {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        
        var newQuestionSet: [Question] = SelectedTopic.shared.topic.questionSet
        
        switch sender.tag {
            
            /// 01 row
            
        case 1:
            newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных", tag: 0)
        case 2:
            newQuestionSet = QuestionDatabase.getQuestionsOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 1)
        case 3:
            newQuestionSet = QuestionDatabase.getQuestionsCollections()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Коллекции", tag: 2)
            
            /// 02 row
            
        case 4:
            newQuestionSet = QuestionDatabase.getQuestionsQueues()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Потоки", tag: 3)
        case 5:
            newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции", tag: 4)
        case 6:
            newQuestionSet = QuestionDatabase.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания", tag: 5)
        case 7:
            newQuestionSet = QuestionDatabase.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления", tag: 6)
            
            /// 03 row
            
        case 8:
            newQuestionSet = QuestionDatabase.getQuestionsStructures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры", tag: 7)
        case 9:
            newQuestionSet = QuestionDatabase.getQuestionsClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Классы", tag: 8)
        case 10:
            newQuestionSet = QuestionDatabase.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства", tag: 9)
        case 11:
            newQuestionSet = QuestionDatabase.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы", tag: 10)
            
            /// 04 row
        
        case 12:
            newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 11)
        case 13:
            newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование", tag: 12)
        case 14:
            newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация", tag: 13)
            
            /// 05 row
            
        case 15:
            newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 14)
        case 16:
            newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 115)
            
            /// 06 row
            
        case 17:
            newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опционалы", tag: 16)
        case 18:
            newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 17)
        case 19:
            newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 18)
            
            /// 07 row
            
        case 20:
            newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 19)
        case 21:
            newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 20)
        case 22:
            newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблоны", tag: 21)
            
            /// 08 row
            
        case 23:
            newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны", tag: 22)
        case 24:
            newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Алгоритмы", tag: 23)
        case 25:
            newQuestionSet = QuestionDatabase.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC", tag: 24)
    
        default:
            /// Последнюю выбранную категорию делаем "активной"
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].setTitleColor(.white, for: .normal)
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
        }
        
        basicsNumberOfQuestion.text = "Количество вопросов категории: \(newQuestionSet.count)"
    }
}
