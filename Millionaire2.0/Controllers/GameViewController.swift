
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class GameViewController: UIViewController {
    
    // Labels & view
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    // Outlets for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    let allQuestions = QuestionDatabase.getQuestion()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }
    
    
    // MARK: Нажали на кнопку ответа
    @IBAction func answerPressed(_ sender: UIButton) {
        /// Ответили верно
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        } else {
            print("wrong")
            /// Ответили неверно
            let alert = UIAlertController(      title: "Вы проиграли, ваш счет: \(score)",
                                                message: "Хотите начать сначала?",
                                                preferredStyle: .alert)
            let restartAction = UIAlertAction(  title: "Перезапустить",
                                                style: .default,
                                                handler: { action in self.restartGame() })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            questionNumber -= 1
        }
        if questionNumber < allQuestions.count {
            questionNumber += 1
        }
        updateQuestion()
    }
    
    
    // MARK: Обновляем вопрос и ответы или выводим алёрт
    func updateQuestion() {
        /// Назначим изначальное значение для счетчика вопросов
        questionCounter.text = "1 / \(allQuestions.count)"
        /// Проверка перед следующим ходом
        if questionNumber <= allQuestions.count - 1 {
            /// Обновляем вопрос
            questionLabel.text = allQuestions[questionNumber].question
            /// Обновляем варианты ответов
            optionA.setTitle(allQuestions[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestions[questionNumber].optionB, for: .normal)
            optionC.setTitle(allQuestions[questionNumber].optionC, for: .normal)
            optionD.setTitle(allQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = allQuestions[questionNumber].correctAnswer
        } else {
            /// Если закончились - вызываем алерт
            let alert = UIAlertController(      title: "Отлично! Ваш счет: \(score)!",
                                                message: "Хотите начать сначала?",
                                                preferredStyle: .alert)
            let restartAction = UIAlertAction(  title: "Перезапустить",
                                                style: .default,
                                                handler: { action in self.restartGame() })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            questionNumber -= 1
        }
        updateUI()
    }
    
    
    // MARK: Обновляем показатели
    func updateUI() {
        scoreLabel.text = "Счет: \(score)"
        questionCounter.text = "\(questionNumber + 1) / \(allQuestions.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(questionNumber + 1)
    }
    
    
    // MARK: Перезапускаем игру
    func restartGame() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
}

