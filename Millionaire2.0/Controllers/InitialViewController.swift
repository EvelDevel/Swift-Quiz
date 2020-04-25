
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

// MARK: TODO
/// Перебрать все функции гейм-контроллера и расставить их по порядку исходя из логики
/// Добавить всплывающее окно "вы уверены?" на кнопку "очистить рекорды"
/// Считать общее количество раз, сколько сыграна каждая категория
/// Подумать как сделать кнопки выбора тем через лэйаут
/// Сделать возможность добавлять свои вопросы (это жопа, но надо разобраться)
/// Сделать лэйбл выбранной категории на саму кнопку 

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
        showLastGameInfo()
        addDefaultQuestionSet()
    }
    
    /// Добавляем дефолтную категорию вопросов и загружаем сет
    func addDefaultQuestionSet() {
        if SelectedTopic.shared.topic.questionSet.count == 0 {
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных", tag: 0)
            selectedTopic.text = "Типы данных"
        } else {
            selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
        }
    }
    
    /// Присваиваем делегаты во время вызова сигвея, и передаем информацию
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toGameViewController" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        } else if segue.identifier == "toTopicSelection" {
            let topicView = segue.destination as! TopicViewController
            topicView.delegate = self
        }
    }
}

///

// MARK: Загружаем информацию о последней игре при входе
extension InitialViewController {
    func showLastGameInfo() {
        let records: [Record] = recordCaretaker.getRecordsList()
        if records.count != 0 {
            let roundedPercents = String(format: "%.1f", records[0].percentOfCorrectAnswer ?? 0)
            helpCounterLabel.text = "Использовано подсказок: \(records[0].helpCounter ?? 0)"
            lastTopic.text = "Категория: \(records[0].topic ?? "")"
            lastScore.text = "Правильных ответов: \(records[0].score ?? 0) (\(roundedPercents)%)"
            totalQuestions.text = "Общее количество вопросов: \(records[0].totalQuestion ?? 0)"
            playedNumberLabel.text = "Пройдено вопросов: \(records[0].playedNum ?? 0)"
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
