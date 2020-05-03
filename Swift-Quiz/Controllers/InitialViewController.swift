
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

// MARK: TODO
/// В таблице рекордов - свайпом удалять любой рекорд
/// Добавить звуки нажатия клавиш
/// Добавить настройку "сохранять" или "не сохранять" игру при досрочном выходе
/// Добавить всплывающее окно "вы уверены?" на кнопку "очистить рекорды"
/// Считать общее количество раз, сколько сыграна каждая категория
/// Разобраться с размером картинок или их контент-модом

class InitialViewController: UIViewController {
    @IBOutlet weak var selectedTopic: UILabel!
    @IBOutlet weak var lastTopic: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBAction func startGame(_ sender: UIButton) { }
    @IBOutlet weak var helpCounterLabel: UILabel!
    @IBOutlet weak var playedNumberLabel: UILabel!
    private let recordCaretaker = RecordsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDefaultQuestionSet()
        showLastGameInfo()
    }
}


// MARK: Загрузка дефолтной категории
extension InitialViewController {
    
    func addDefaultQuestionSet() {
        if SelectedTopic.shared.topic.questionSet.count == 0 {
            /// Первый запуск: добавляем сет, обновлянем название
            let newSet = QuestionDatabase.getQuestionsTypesOfData()
            SelectedTopic.shared.addQuestionSet(newSet, topic: "Типы данных", tag: 0)
            selectedTopic.text = "Типы данных"
        } else {
            /// При любом повторном: берем информацию из синглтона
            selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
        }
    }
}


// MARK: Загружаем информацию о последней игре при входе
extension InitialViewController {
    
    func showLastGameInfo() {
        /// Получаем список рекордов
        let records: [Record] = recordCaretaker.getRecordsList()
        if records.count != 0 {
            /// Если он не пуст, инициализируем необходимые значения
            let roundedPercents = String(format: "%.1f", records[0].percentOfCorrectAnswer ?? 0)
            helpCounterLabel.text = "Использовано подсказок: \(records[0].helpCounter ?? 0)"
            lastTopic.text = "Категория: \(records[0].topic ?? "")"
            lastScore.text = "Правильных ответов: \(records[0].score ?? 0) (\(roundedPercents)%)"
            totalQuestions.text = "Общее количество вопросов: \(records[0].totalQuestion ?? 0)"
            playedNumberLabel.text = "Пройдено вопросов: \(records[0].playedNum ?? 0)"
        }
    }
}


// MARK: Активация делегатов
extension InitialViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// Указываем себя в качестве делегата в момент перехода по нужным segue
        if segue.identifier  == "toGameViewController" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        } else if segue.identifier == "toTopicSelection" {
            let topicView = segue.destination as! TopicViewController
            topicView.delegate = self
        }
    }
}


// MARK: Работа с делегатом GameViewController
extension InitialViewController: GameViewControllerDelegate {
    
    func didEndGame(result: Int,
                    totalQuestion: Int,
                    percentOfCorrect: Double,
                    topic: String,
                    helpCounter: Int,
                    playedNum: Int) {
        
        playedNumberLabel.text = "Пройдено вопросов: \(playedNum)"
        helpCounterLabel.text = "Использовано подсказок: \(helpCounter)"
        lastTopic.text = "Категория: \(topic)"
        lastScore.text = "Правильных ответов: \(result) (\(percentOfCorrect)%)"
        totalQuestions.text = "Общее количество вопросов: \(totalQuestion)"
    }
}


// MARK: Работа с делегатом TopicViewController
extension InitialViewController: TopicViewControllerDelegate {
    
    func selectedCategory() {
        selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
    }
}
