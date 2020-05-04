
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

protocol TopicViewControllerDelegate: class {
    func selectedCategory()
}

class TopicViewController: UIViewController {

    @IBOutlet weak var selectedTopicInformation: UILabel!
    @IBOutlet weak var firstTopic: HalfRoundButton!
    @IBOutlet var topicButtonOutlets: [UIButton]!
    
    private var audioPlayer = AVAudioPlayer()
    weak var delegate: TopicViewControllerDelegate?
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
    }
    
    /// Звуки
    @IBAction func tapTopicButtonSound(_ sender: Any) {
        if Game.shared.settings.sound == 0 {
            guard let url = Bundle.main.url(forResource: "button2", withExtension: "wav") else { return }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.play()
            } catch { print("Error witn button sound on topic view") }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionsToArray(sender: UIButton())
    }
}


///


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
    
    /// Номера tag-ов удаленных кнопок: 3
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        
        switch sender.tag {
        case 1:
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных", tag: 0)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
        case 2:
            let newQuestionSet = QuestionDatabase.getQuestionsOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 1)
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /*
        case 4:
            let newQuestionSet = QuestionDatabase.getQuestionsCollections()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Коллекции")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 2
            
            /// 2-ой ряд
            
        case 5:
            let newQuestionSet = QuestionDatabase.getQuestionsQueues()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Потоки")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 3
        case 6:
            let newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 4
        case 7:
            let newQuestionSet = QuestionDatabase.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 5
        case 8:
            let newQuestionSet = QuestionDatabase.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 6
            
            /// 3-ий ряд
            
        case 9:
            let newQuestionSet = QuestionDatabase.getQuestionsStructures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 7
        case 10:
            let newQuestionSet = QuestionDatabase.getQuestionsClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Классы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 8
        case 11:
            let newQuestionSet = QuestionDatabase.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 9
        case 12:
            let newQuestionSet = QuestionDatabase.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 10
            
            /// 4-ый ряд
            
        case 13:
            let newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 11
        case 14:
            let newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 12
        case 15:
            let newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 13
            
            /// 5-ый ряд
            
        case 16:
            let newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 14
        case 17:
            let newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 15
            
            /// 6-ой ряд
            
        case 18:
            let newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опционалы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 16
        case 19:
            let newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 17
        case 20:
            let newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 18
            
            /// 7-ой ряд
            
        case 21:
            let newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 19
        case 22:
            let newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 20
        case 23:
            let newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблоны")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 21
            
            /// 8-ой ряд
            
        case 24:
            let newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 22
        case 25:
            let newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Алгоритмы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 23
        case 26:
            let newQuestionSet = QuestionDatabase.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            updatedTag = 24
            */
        default:
            /// "Выделяем" дефолтную первую категорию, и загружаем вопросы
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].setTitleColor(.white, for: .normal)
            topicButtonOutlets[SelectedTopic.shared.topic.topicTag].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
            selectedTopicInformation.text = "Количество вопросов: \(SelectedTopic.shared.topic.questionSet.count)"
        }
        
        delegate?.selectedCategory()
    }
}
