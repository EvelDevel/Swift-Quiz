
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var selectedTopicInformation: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBAction func startGame(_ sender: UIButton) { }
    @IBOutlet var topicButtonOutlets: [UIButton]!
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toGameViewController" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionsToArray(sender: UIButton())
    }
}


///


// MARK: Работа с делегатом
extension InitialViewController: GameViewControllerDelegate {
    func didEndGame(_ result: Int, _ totalQuestion: Int) {
        lastScore.text = "Ваш последний счет: \(result)"
        totalQuestions.text = "Всего вопросов: \(totalQuestion)"
    }
}


// MARK: Приводим все кнопки к стоковому виду ("обнуляем")
extension InitialViewController {
    func updateTopicButtons() {
        for i in 0..<topicButtonOutlets.count {
            topicButtonOutlets[i].setTitleColor(.black, for: .normal)
            topicButtonOutlets[i].backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        }
    }
}


// MARK: Обработка выбора категории вопросов
extension InitialViewController {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        switch sender.tag {
        case 1:
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 2:
            let newQuestionSet = QuestionDatabase.getQuestionsOperators()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 4:
            let newQuestionSet = QuestionDatabase.getQuestionsCollections()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Коллекции")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 2-ой ряд
            
        case 5:
            let newQuestionSet = QuestionDatabase.getQuestionsQueues()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Потоки")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 6:
            let newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 7:
            let newQuestionSet = QuestionDatabase.getQuestionsClosures()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 8:
            let newQuestionSet = QuestionDatabase.getQuestionsEnums()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 3-ий ряд
            
        case 9:
            let newQuestionSet = QuestionDatabase.getQuestionsStructures()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 10:
            let newQuestionSet = QuestionDatabase.getQuestionsClasses()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Классы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 11:
            let newQuestionSet = QuestionDatabase.getQuestionsProperties()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 12:
            let newQuestionSet = QuestionDatabase.getQuestionsMethods()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 4-ый ряд
            
        case 13:
            let newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 14:
            let newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 15:
            let newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 5-ый ряд
            
        case 16:
            let newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 17:
            let newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 6-ой ряд
            
        case 18:
            let newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опционалы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 19:
            let newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 20:
            let newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 7-ой ряд
            
        case 21:
            let newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типа")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 22:
            let newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 23:
            let newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблоны")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
            /// 8-ой ряд
            
        case 24:
            let newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 25:
            let newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Алгоритмы")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        case 26:
            let newQuestionSet = QuestionDatabase.getQuestionsARC()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
            
        default:
            /// "Выделяем" дефолтную первую категорию, и загружаем вопросы
            topicButtonOutlets[0].setTitleColor(.white, for: .normal)
            topicButtonOutlets[0].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных")
            selectedTopicInformation.text = "Количество вопросов: \(newQuestionSet.count)"
        }
    }
}



