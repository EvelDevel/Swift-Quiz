
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var pressHelpCounterLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    private let questionOrder = Game.shared.settings.questionOrder
    
    private var initialQuestionSet: [Question] = []     // Исходный массив вопросов (после выбора категории)
    private var currentQuestionNumber: Int = 1          // Текущий номер вопроса в игре
    private var currentQuestionIndex = 0                // Реальный номер этого вопроса в массиве
    private var score: Int = 0                          // Счет, или количество правильных ответов
    private var correctAnswer: String = ""              // Строковый литерал правильного ответа
    private var correctAnswerNewPosition = 0            // Новая позиция правильного ответа после shuffle()
    private var percent: Double = 0                     // Процент правильных ответов
    private var imageName = ""                          // Имя изображения
    private var helpCounter = 0                         // Счетчик использованных подсказок
    
    private var shuffledAnswersArray: [String] = []     // Массив перемешанных вариантов ответа
    weak var delegate: GameViewControllerDelegate?      // Экземпляр делегата
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        firstViewAppear()
        updateQuestion()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        callDelegate()
    }
}


// MARK: ViewDidLoad
extension GameViewController {
    
    func addQuestionSet() {
        /// Добавляем сет вопросов (настройки)
        if questionOrder == 0 {
            initialQuestionSet = SelectedTopic.shared.topic.questionSet
        } else {
            initialQuestionSet = SelectedTopic.shared.topic.questionSet.shuffled()
        }
    }
    
    func firstViewAppear() {
        /// Первое появление Game View, установка дефолтных лейблов
        questionCounterLabel.text = "1 / \(initialQuestionSet.count)"
        if helpCounter == 0 {
            pressHelpCounterLabel.text = ""
        }
    }
    
    func updateQuestion() {
        setDafaultButtonsColor()
        addQuestionContent()
        updateUI()
    }
}


// MARK: UpdateQuestion
extension GameViewController {
    
    func setDafaultButtonsColor() {
        optionA.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionB.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionC.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionD.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
    }
   
    func addQuestionContent() {
        if currentQuestionIndex <= initialQuestionSet.count - 1 {
            setQuestionImage()
            setQuestionText()
            saveCorrectAnswerText()
            shuffleAnswersPositions()
            placeShuffledAnswers()
        } else {
            callDelegate()
            showAlert(title: "Вопросы закончились", message: "Ваш счет")
        }
    }
    
    func updateUI() {
        scoreLabel.text = "Счет: \(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(initialQuestionSet.count)"
        progressView.frame.size.width = (view.frame.size.width / CGFloat(initialQuestionSet.count)) * CGFloat(currentQuestionIndex)
    }
    
    func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.initialQuestionSet.count) * 100))) ?? 0
    }
}
    
    
// MARK: addQuestionContent и updateUI
extension GameViewController {
    
    func setQuestionImage() {
        let imageName = initialQuestionSet[currentQuestionIndex].image
        if  imageName == "" {
            questionImageView.image = nil
            questionLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        } else {
            questionImageView.image = UIImage(named: imageName)
            questionLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        }
    }
    
    func setQuestionText() {
        /// Загружаем либо первую формилуровку, либо рандомно (настройки)
        if Game.shared.settings.questionTextShuffeling == 1 {
            let shuffledArray = initialQuestionSet[currentQuestionIndex].question.shuffled()
            questionLabel.text = shuffledArray[0]
        } else {
            questionLabel.text = initialQuestionSet[currentQuestionIndex].question[0]
        }
    }
    
    func saveCorrectAnswerText() {
        /// Сохраняем текст правильного ответа (их позиции могут перемешиваться)
        switch initialQuestionSet[currentQuestionIndex].correctAnswer {
        case 1: correctAnswer = initialQuestionSet[currentQuestionIndex].optionA
        case 2: correctAnswer = initialQuestionSet[currentQuestionIndex].optionB
        case 3: correctAnswer = initialQuestionSet[currentQuestionIndex].optionC
        case 4: correctAnswer = initialQuestionSet[currentQuestionIndex].optionD
        default: print("Error with correct placing answers")
        }
    }
    
    func shuffleAnswersPositions() {
        /// Перемешиваем поизиции (настройки)
        var tempAnswersArray: [String] = []
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionA)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionB)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionC)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionD)
        shuffledAnswersArray = tempAnswersArray.shuffled()
        /// Находим новое положение правильного ответа
        for i in 0..<shuffledAnswersArray.count {
            if shuffledAnswersArray[i] == correctAnswer {
                correctAnswerNewPosition = i + 1
            }
        }
    }
    
    func placeShuffledAnswers() {
        /// Располагаем ответы в новом порядке на кнопках
        optionA.setTitle(shuffledAnswersArray[0], for: .normal)
        optionB.setTitle(shuffledAnswersArray[1], for: .normal)
        optionC.setTitle(shuffledAnswersArray[2], for: .normal)
        optionD.setTitle(shuffledAnswersArray[3], for: .normal)
    }
}


// MARK: Нажали на кнопку ответа
extension GameViewController {
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswerNewPosition {
            score += 1
            changeButtonColor(sender: sender, answerIsCorrect: true)
        } else {
            changeButtonColor(sender: sender, answerIsCorrect: false)
            if Game.shared.settings.endGame == 1 {
                delegate?.didEndGame(result: score,
                                     totalQuestion: initialQuestionSet.count,
                                     percentOfCorrect: updatePercentage(),
                                     topic: SelectedTopic.shared.topic.topicName,
                                     helpCounter: helpCounter,
                                     playedNum: currentQuestionIndex)
                
                saveRecordAndSettings()
                showAlert(title: "Ответ неверный", message: "Ваш счет")
            }
        }
        
        if currentQuestionIndex < initialQuestionSet.count {
            currentQuestionIndex += 1
            currentQuestionNumber += 1
        }
        
        /// Делаем небольшую задержку на смену вопроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.updateQuestion()
        }
    }
    
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


// MARK: Завершение игры
extension GameViewController {
    
    /// Передача информации при выходе с экрана
    func callDelegate() {
        
        if currentQuestionIndex + 1 != SelectedTopic.shared.topic.questionSet.count {
            /// На случай свайп-дауна (сохраняем рекорд незавершенной игры)
            saveRecordAndSettings()
            delegate?.didEndGame(result: score,
                                 totalQuestion: initialQuestionSet.count,
                                 percentOfCorrect: updatePercentage(),
                                 topic: SelectedTopic.shared.topic.topicName,
                                 helpCounter: helpCounter,
                                 playedNum: currentQuestionIndex)
        } else {
            /// А это при завершении игры (закончились вопросы)
            delegate?.didEndGame(result: score,
                                 totalQuestion: initialQuestionSet.count,
                                 percentOfCorrect: updatePercentage(),
                                 topic: SelectedTopic.shared.topic.topicName,
                                 helpCounter: helpCounter,
                                 playedNum: currentQuestionIndex)
        }
    }
    
    /// Сохранение рекорда и настроек игры
    func saveRecordAndSettings() {
        let record = Record(date: Date(),
                            score: score,
                            topic: SelectedTopic.shared.topic.topicName,
                            totalQuestion: initialQuestionSet.count,
                            percentOfCorrectAnswer: updatePercentage(),
                            helpCounter: helpCounter,
                            playedNum: currentQuestionIndex)
        
        var shuffleToSave = 0
        if Game.shared.settings.questionTextShuffeling == 1 {
            shuffleToSave = 1
        }
        var endGameToSave = 0
        if Game.shared.settings.endGame == 1 {
            endGameToSave = 1
        }
        
        let setting = Settings(questionOrder: questionOrder,
                               questionTextShuffeling: shuffleToSave,
                               endGame: endGameToSave)
        
        Game.shared.addRecord(record)
        Game.shared.saveSettings(setting)
    }
    
    /// Выводим alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(      title: "\(title)",
                                            message: "\(message): \(score)",
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
        currentQuestionNumber -= 1
    }

    /// Перезагрузка игры
    func restartGame() {
        score = 0
        currentQuestionNumber = 1
        currentQuestionIndex = 0
        updateQuestion()
    }
}


// MARK: Активация делегатов
extension GameViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toHelpViewController" {
            let helpView = segue.destination as! HelpViewController
            helpView.delegate = self
            helpView.questionID = initialQuestionSet[currentQuestionIndex].questionId
            helpCounter += 1
            pressHelpCounterLabel.text = "\(helpCounter)"
        }
    }
}


// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate {
    func updateAfterHelp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.currentQuestionNumber += 1
            self.currentQuestionIndex += 1
            self.updateQuestion()
        }
    }
}
