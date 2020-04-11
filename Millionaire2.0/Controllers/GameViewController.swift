
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(_ result: Int, _ totalQuestion: Int)
}

class GameViewController: UIViewController {
    
    weak var delegate: GameViewControllerDelegate?
    
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
        if sender.tag == selectedAnswer {
            /// Ответили верно
            score += 1
        } else {
            /// Ответили неверно
            self.delegate?.didEndGame(score, allQuestions.count)
            showAlert(title: "Вы проиграли, ваш счет", message: "Хотите начать сначала?")
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
            self.delegate?.didEndGame(score, allQuestions.count)
            showAlert(title: "Отлично! Ваш счет", message: "Хотите начать сначала?")
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
    
    
    // MARK: Show Alert
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(      title: "\(title): \(score)",
                                            message: "\(message)",
                                            preferredStyle: .alert)
        let restartAction = UIAlertAction(  title: "Перезапустить",
                                            style: .default,
                                            handler: { action in self.restartGame() })
        let quitAction = UIAlertAction(     title: "Выйти",
                                            style: .default,
                                            handler: { action in self.dismiss(animated: true, completion: nil) })
        
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        present(alert, animated: true, completion: nil)
        questionNumber -= 1
    }
}
