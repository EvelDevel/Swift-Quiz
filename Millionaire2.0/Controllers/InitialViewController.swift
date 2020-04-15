
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
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
        case 2:
            let newQuestionSet = QuestionDatabase.getQuestionsOperators()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы")
        case 3:
            let newQuestionSet = QuestionDatabase.getQuestionsStrings()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Строки")
        case 4:
            let newQuestionSet = QuestionDatabase.getQuestionsCollections()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Коллекции")
            
            /// 2-ой ряд
            
        case 5:
            let newQuestionSet = QuestionDatabase.getQuestionsQueues()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Потоки")
        case 6:
            let newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции")
        case 7:
            let newQuestionSet = QuestionDatabase.getQuestionsClosures()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания")
        case 8:
            let newQuestionSet = QuestionDatabase.getQuestionsEnums()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления")
            
            /// 3-ий ряд
            
        case 9:
            let newQuestionSet = QuestionDatabase.getQuestionsStructures()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры")
        case 10:
            let newQuestionSet = QuestionDatabase.getQuestionsClasses()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Классы")
        case 11:
            let newQuestionSet = QuestionDatabase.getQuestionsProperties()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства")
        case 12:
            let newQuestionSet = QuestionDatabase.getQuestionsMethods()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы")
            
            /// 4-ый ряд
            
        case 13:
            let newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты")
        case 14:
            let newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование")
        case 15:
            let newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация")
            
            /// 5-ый ряд
            
        case 16:
            let newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация")
        case 17:
            let newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок")
            
            /// 6-ой ряд
            
        case 18:
            let newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опционалы")
        case 19:
            let newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов")
        case 20:
            let newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения")
            
            /// 7-ой ряд
            
        case 21:
            let newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типа")
        case 22:
            let newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы")
        case 23:
            let newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблоны")
            
            /// 8-ой ряд
            
        case 24:
            let newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Паттерны")
        case 25:
            let newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Алгоритмы")
        case 26:
            let newQuestionSet = QuestionDatabase.getQuestionsARC()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC")
            
        default:
            /// "Выделяем" дефолтную первую категорию, и загружаем вопросы
            topicButtonOutlets[0].setTitleColor(.white, for: .normal)
            topicButtonOutlets[0].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            PickedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных")
        }
    }
}



