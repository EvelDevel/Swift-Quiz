
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(_ result: Int, _ totalQuestion: Int, _ percentOfCorrect: Double)
}

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
    
    // TODO: Отредактировать наполнение массива для работы из синглтона с вопросами
    let allQuestions = SelectedTopic.shared.questions
    
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    weak var delegate: GameViewControllerDelegate?
    var percent: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }
    
    // Обновляем показатели
    func updateUI() {
        scoreLabel.text = "Счет: \(score)"
        questionCounter.text = "\(questionNumber + 1) / \(allQuestions.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(questionNumber + 1)
    }
    
    // Перезапускаем игру
    func restartGame() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
    // Продолжаем игру
    func continueGame() {
        questionNumber += 1
        updateQuestion()
    }
}


// MARK: Нажали на кнопку ответа
extension GameViewController {
    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == selectedAnswer {
            score += 1
            changeButtonColor(sender: sender, answerIsCorrect: true)
        } else {
            changeButtonColor(sender: sender, answerIsCorrect: false)
            self.percent = Double(self.score) / Double(self.allQuestions.count) * 100
            delegate?.didEndGame(score, allQuestions.count, percent)
            /// showAlert(title: "Неверно, ваш счет", message: "")
        }
        
        if questionNumber < allQuestions.count {
            questionNumber += 1
        }
        
        /// Делаем небольшую задержку на смену вопроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.updateQuestion()
        }
    }
}


// MARK: Обновляем вопрос и ответы или выводим алёрт
extension GameViewController {
    
    func updateQuestion() {
        questionCounter.text = "1 / \(allQuestions.count)"
        
        /// Возвращаем белый цвет ответов
        optionA.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionB.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionC.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionD.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        
        if questionNumber <= allQuestions.count - 1 {
            questionLabel.text = allQuestions[questionNumber].question
            optionA.setTitle(allQuestions[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestions[questionNumber].optionB, for: .normal)
            optionC.setTitle(allQuestions[questionNumber].optionC, for: .normal)
            optionD.setTitle(allQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = allQuestions[questionNumber].correctAnswer
        } else {
            self.percent = Double(self.score) / Double(self.allQuestions.count) * 100
            delegate?.didEndGame(score, allQuestions.count, percent)
            showAlert(title: "Отлично! Ваш счет", message: "")
        }
        updateUI()
    }
}


// MARK: Обработка завершения игры
extension GameViewController {

    func showAlert(title: String, message: String) {
        let record = Record(date: Date(),
                            score: score,
                            topic: SelectedTopic.shared.topic,
                            totalQuestion: allQuestions.count,
                            percentOfCorrectAnswer: Double(score) / Double(allQuestions.count) * 100) 
        
        Game.shared.addRecord(record)

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


// MARK: Изменение цвета кнопки после ответа
extension GameViewController {
    
    func changeButtonColor(sender: UIButton, answerIsCorrect: Bool) {
        switch sender.tag {
        case 1: optionA.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.5725965062, green: 0.8207090736, blue: 0.4017996262, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 2: optionB.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.5725965062, green: 0.8207090736, blue: 0.4017996262, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 3: optionC.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.5725965062, green: 0.8207090736, blue: 0.4017996262, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 4: optionD.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.5725965062, green: 0.8207090736, blue: 0.4017996262, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        default:
            print("We have error with answer batton tags")
        }
    }
}
