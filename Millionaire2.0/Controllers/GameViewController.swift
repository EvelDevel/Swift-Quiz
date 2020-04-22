
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    
    func didEndGame(_ result: Int, _ totalQuestion: Int, _ percentOfCorrect: Double, _ topic: String)
}

class GameViewController: UIViewController {
    
    // Labels & view
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionTopHalf: UIView!
    //@IBOutlet weak var questionImageViewHeight: NSLayoutConstraint!
    
    // Outlets for buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    private var allQuestions: [Question] = []
    private var selectedOrder: QuestionOrder?
    private var questionNumber: Int = 0
    private var score: Int = 0
    private var selectedAnswer: Int = 0
    private var percent: Double = 0
    private var imageName = ""
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setArrayAndOrder()
        updateQuestion()
        updateUI()
    }
    
    /// Передаем информацию по подсказке при переходе
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toHelpViewController" {
            let helpView = segue.destination as! HelpViewController
            helpView.delegate = self
            helpView.questionID = allQuestions[questionNumber].questionId
        }
    }
}

///

// MARK: Две основные функции апдейта и перезапуска игры
extension GameViewController {
    
    func updateUI() {
        scoreLabel.text = "Счет: \(score) | \(updatePercentage())%"
        questionCounter.text = "\(questionNumber + 1) / \(allQuestions.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.count)) * CGFloat(questionNumber + 1)
        
       
    }
    
    func restartGame() {
        score = 0
        questionNumber = 0
        updateQuestion()
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
            
            /// Устанавливаем фото
            imageName = allQuestions[questionNumber].image
            
            print("Имя фотки: \(imageName)")
            print("Номер объекта: \(questionNumber)")
            print("----")
            
            if imageName == "" {
                questionImageView.image = nil
                //questionImageViewHeight.constant = 0
                questionLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .light)
            } else {
                //questionImageViewHeight.constant = 120
                questionImageView.image = UIImage(named: imageName)
                questionLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
            }
            
            questionLabel.text = allQuestions[questionNumber].question
            optionA.setTitle(allQuestions[questionNumber].optionA, for: .normal)
            optionB.setTitle(allQuestions[questionNumber].optionB, for: .normal)
            optionC.setTitle(allQuestions[questionNumber].optionC, for: .normal)
            optionD.setTitle(allQuestions[questionNumber].optionD, for: .normal)
            selectedAnswer = allQuestions[questionNumber].correctAnswer
        } else {
            self.percent = updatePercentage()
            delegate?.didEndGame(score, allQuestions.count, updatePercentage(), SelectedTopic.shared.topic)
            let title = """
                        Вопросы закончились
                        Ваш счет
                        """
            showAlert(title: title, message: "")
        }
        updateUI()
    }
}

// MARK: Заполняем массив вопросов в нужном порядке
extension GameViewController {
    
    func setArrayAndOrder() {
        selectedOrder = Game.shared.getQuestionOrderSatus()
        
        if selectedOrder == .straight {
            allQuestions = SelectedTopic.shared.questions
        } else {
            allQuestions = SelectedTopic.shared.questions.shuffled()
        }
    }
}

// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate {
    
}

// MARK: Расчет процента правильных ответов
extension GameViewController {
    
    func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.allQuestions.count) * 100))) ?? 0
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
            delegate?.didEndGame(score, allQuestions.count, updatePercentage(), SelectedTopic.shared.topic)
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

// MARK: Обработка завершения игры
extension GameViewController {
    
    func showAlert(title: String, message: String) {
        let record = Record(date: Date(),
                            score: score,
                            topic: SelectedTopic.shared.topic,
                            totalQuestion: allQuestions.count,
                            percentOfCorrectAnswer: percent)
        
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
