
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var selectedTopic: UILabel!
    @IBOutlet weak var lastTopic: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBAction func startGame(_ sender: UIButton) { }
    private let recordCaretaker = RecordsCaretaker()
    var selectedTopicTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLastGameInfo()
        addDefaultQuestionSet()
    }
    
    // Добавляем дефолтную категорию вопросов и загружаем сет
    func addDefaultQuestionSet() {
        let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
        SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы данных")
        selectedTopic.text = "Выбрана категория: \(SelectedTopic.shared.topic)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toGameViewController" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        } else if segue.identifier == "toTopicSelection" {
            let topicView = segue.destination as! TopicViewController
            topicView.delegate = self
            topicView.updatedTag = selectedTopicTag
        }
    }
}


// MARK: Загружаем информацию о последней игре при входе
extension InitialViewController {
    func showLastGameInfo() {
        let records: [Record] = recordCaretaker.getRecordsList()
        if records.count != 0 {
            let roundedPercents = String(format: "%.1f", records[0].percentOfCorrectAnswer ?? 0)
            lastTopic.text = "Категория: \(records[0].topic ?? "")"
            lastScore.text = "Правильных ответов: \(records[0].score ?? 0) (\(roundedPercents)%)"
            totalQuestions.text = "Общее количество вопросов: \(records[0].totalQuestion ?? 0)"
        }
    }
}


// MARK: Работа с делегатом GameViewController
extension InitialViewController: GameViewControllerDelegate {
    func didEndGame(_ result: Int,
                    _ totalQuestion: Int,
                    _ percentOfCorrect: Double,
                    _ topic: String) {
        
        lastTopic.text = "Категория: \(topic)"
        lastScore.text = "Правильных ответов: \(result) (\(percentOfCorrect)%)"
        totalQuestions.text = "Общее количество вопросов: \(totalQuestion)"
    }
}


// MARK: Работа с делегатом TopicViewController
extension InitialViewController: TopicViewControllerDelegate {
    func selectedCategory(tag: Int) {
        selectedTopic.text = "Выбрана категория: \(SelectedTopic.shared.topic)"
        self.selectedTopicTag = tag
    }
}
