
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol TopicViewControllerDelegate: class {
    func selectedCategory()
}

class TopicViewController: UIViewController {

    @IBOutlet weak var selectedTopicInformation: UILabel!
    @IBOutlet weak var firstTopic: HalfRoundButton!
    @IBOutlet var topicButtonOutlets: [UIButton]!
    weak var delegate: TopicViewControllerDelegate?
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionsToArray(sender: UIButton())
    }
}


// MARK: Звук выбора
extension TopicViewController {
    @IBAction func tapTopicButtonSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
    }
}


// MARK: Приводим все кнопки к стоковому виду ("обнуляем")
extension TopicViewController {
    
    func updateTopicButtons() {
        for i in 0..<topicButtonOutlets.count {
            topicButtonOutlets[i].setTitleColor(.black, for: .normal)
            topicButtonOutlets[i].backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        }
    }
}

// MARK: Обработка выбора категории вопросов
extension TopicViewController {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        
        switch sender.tag {
            
            /// 01 row
            
        case 1:
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных", tag: 0)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 2:
            let newQuestionSet = QuestionDatabase.getQuestionsOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 1)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 3:
            let newQuestionSet = QuestionDatabase.getQuestionsCollections()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Коллекции", tag: 2)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 02 row
            
        case 4:
            let newQuestionSet = QuestionDatabase.getQuestionsQueues()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Потоки", tag: 3)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 5:
            let newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции", tag: 4)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 6:
            let newQuestionSet = QuestionDatabase.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания", tag: 5)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 7:
            let newQuestionSet = QuestionDatabase.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления", tag: 6)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 03 row
            
        case 8:
            let newQuestionSet = QuestionDatabase.getQuestionsStructures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры", tag: 7)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 9:
            let newQuestionSet = QuestionDatabase.getQuestionsClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Классы", tag: 8)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 10:
            let newQuestionSet = QuestionDatabase.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства", tag: 9)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 11:
            let newQuestionSet = QuestionDatabase.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы", tag: 10)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 04 row
        
        case 12:
            let newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 11)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 13:
            let newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование", tag: 12)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 14:
            let newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация", tag: 13)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 05 row
            
        case 15:
            let newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 14)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 16:
            let newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 115)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 06 row
            
        case 17:
            let newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опционалы", tag: 16)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 18:
            let newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 17)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 19:
            let newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 18)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 07 row
            
        case 20:
            let newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 19)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 21:
            let newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 20)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 22:
            let newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблоны", tag: 21)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 08 row
            
        case 23:
            let newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны", tag: 22)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 24:
            let newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Алгоритмы", tag: 23)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 25:
            let newQuestionSet = QuestionDatabase.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC", tag: 24)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
    
        default:
            /// "Выделяем" дефолтную первую категорию, и загружаем вопросы
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].setTitleColor(.white, for: .normal)
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
            selectedTopicInformation.text = "Количество вопросов: \(SelectedTopic.shared.topic.questionSet.count)"
        }
        
        delegate?.selectedCategory()
    }
}
