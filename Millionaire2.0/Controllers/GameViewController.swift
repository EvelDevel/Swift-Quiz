
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
}

class GameViewController: UIViewController {
    // Labels & view
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var pressHelpCounterLabel: UILabel!
    
    // Outlets for answer buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    // Settings, порядок вопросов (случайный или по порядку)
    private let questionOrder = Game.shared.settings.questionOrder 
    
    // Private properties
    private var initialQuestionSet: [Question] = []     // Исходный массив вопросов (после выбора категории)
    private var currentQuestionNumber: Int = 0          // Текущий номер вопроса в игре
    private var score: Int = 0                          // Счет, или количество правильных ответов
    private var correctAnswer: String = ""              // Строковый литерал правильного ответа
    private var correctAnswerNewPosition = 0            // Новая позиция правильного ответа после shuffle()
    private var percent: Double = 0                     // Процент правильных ответов
    private var imageName = ""                          // Имя изображения
    private var helpCounter = 0                         // Счетчик использованных подсказок
    private var takeHelpFlag = false                    // Флаг использования подсказки (убираем повторное срабатывание)
    private var shuffledAnswersArray: [String] = []     // Массив перемешанных вариантов ответа
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        firstViewAppear()
        updateQuestion()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        callDelegate()
    }
    
    func addQuestionSet() {
        if questionOrder == 0 {
            initialQuestionSet = SelectedTopic.shared.topic.questionSet
        } else {
            initialQuestionSet = SelectedTopic.shared.topic.questionSet.shuffled()
        }
    }
    
    func firstViewAppear() {
        questionCounterLabel.text = "1 / \(initialQuestionSet.count)"
        if helpCounter == 0 {
            pressHelpCounterLabel.text = ""
        }
    }
    
    func updateQuestion() {
        resetHelpFlag()
        setDafaultButtonsColor()
        addQuestionContent()
        updateUI()
    }
}


///


// MARK: Работа внутренних функций Update Question
extension GameViewController {
    
    func resetHelpFlag() {
        takeHelpFlag = false
    }
    
    func setDafaultButtonsColor() {
        optionA.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionB.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionC.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionD.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
    }
   
    func addQuestionContent() {
        if currentQuestionNumber <= initialQuestionSet.count - 1 {
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
    
    func setQuestionImage() {
        let imageName = initialQuestionSet[currentQuestionNumber].image
        if  imageName == "" {
            questionImageView.image = nil
            questionLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        } else {
            questionImageView.image = UIImage(named: imageName)
            questionLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        }
    }
    
    func setQuestionText() {
        if Game.shared.settings.questionTextShuffeling == 1 {
            let shuffledArray = initialQuestionSet[currentQuestionNumber].question.shuffled()
            questionLabel.text = shuffledArray[0]
        } else {
            questionLabel.text = initialQuestionSet[currentQuestionNumber].question[0]
        }
    }
    
    func saveCorrectAnswerText() {
        switch initialQuestionSet[currentQuestionNumber].correctAnswer {
        case 1: correctAnswer = initialQuestionSet[currentQuestionNumber].optionA
        case 2: correctAnswer = initialQuestionSet[currentQuestionNumber].optionB
        case 3: correctAnswer = initialQuestionSet[currentQuestionNumber].optionC
        case 4: correctAnswer = initialQuestionSet[currentQuestionNumber].optionD
        default: print("Error with correct placing answers")
        }
    }
    
    func shuffleAnswersPositions() {
        var tempAnswersArray: [String] = []
        tempAnswersArray.append(initialQuestionSet[currentQuestionNumber].optionA)
        tempAnswersArray.append(initialQuestionSet[currentQuestionNumber].optionB)
        tempAnswersArray.append(initialQuestionSet[currentQuestionNumber].optionC)
        tempAnswersArray.append(initialQuestionSet[currentQuestionNumber].optionD)
        shuffledAnswersArray = tempAnswersArray.shuffled()
        
        for i in 0..<shuffledAnswersArray.count {
            if shuffledAnswersArray[i] == correctAnswer {
                correctAnswerNewPosition = i + 1
            }
        }
    }
    
    func placeShuffledAnswers() {
        optionA.setTitle(shuffledAnswersArray[0], for: .normal)
        optionB.setTitle(shuffledAnswersArray[1], for: .normal)
        optionC.setTitle(shuffledAnswersArray[2], for: .normal)
        optionD.setTitle(shuffledAnswersArray[3], for: .normal)
    }
    
    func updateUI() {
        scoreLabel.text = "Счет: \(score) | \(updatePercentage())%"
        if currentQuestionNumber == 0 {
            questionCounterLabel.text = "1 / \(initialQuestionSet.count)"
        } else {
            questionCounterLabel.text = "\(currentQuestionNumber + 1) / \(initialQuestionSet.count)"
        }
        progressView.frame.size.width = (view.frame.size.width / CGFloat(initialQuestionSet.count)) * CGFloat(currentQuestionNumber + 1)
    }
    
    func callDelegate() {
        
        print(currentQuestionNumber)
        print(SelectedTopic.shared.topic.questionSet.count)
        
        if currentQuestionNumber != SelectedTopic.shared.topic.questionSet.count {
            saveRecordAndSettings()
        }
        delegate?.didEndGame(result: score,
                             totalQuestion: initialQuestionSet.count,
                             percentOfCorrect: updatePercentage(),
                             topic: SelectedTopic.shared.topic.topicName,
                             helpCounter: helpCounter,
                             playedNum: currentQuestionNumber)
    }

    func restartGame() {
        score = 0
        currentQuestionNumber = 0
        updateQuestion()
    }
}


// MARK: Передаем информацию по необходимой подсказке (при переходе на HelpView)
extension GameViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toHelpViewController" {
            let helpView = segue.destination as! HelpViewController
            helpView.delegate = self
            helpView.questionID = initialQuestionSet[currentQuestionNumber].questionId
            if takeHelpFlag == false {
                helpCounter += 1
                takeHelpFlag = true
            }
            pressHelpCounterLabel.text = "\(helpCounter)"
        }
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
                                     playedNum: currentQuestionNumber)
                saveRecordAndSettings()
                showAlert(title: "Ответ неверный", message: "Ваш счет")
            }
        }
        
        if currentQuestionNumber < initialQuestionSet.count {
            currentQuestionNumber += 1
        }
        
        /// Делаем небольшую задержку на смену вопроса
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.updateQuestion()
        }
    }
}


// MARK: Расчет процента правильных ответов
extension GameViewController {
    func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.initialQuestionSet.count) * 100))) ?? 0
    }
}


// MARK: Обработка завершения игры
extension GameViewController {
    
    func saveRecordAndSettings() {
        let record = Record(date: Date(),
                            score: score,
                            topic: SelectedTopic.shared.topic.topicName,
                            totalQuestion: initialQuestionSet.count,
                            percentOfCorrectAnswer: percent,
                            helpCounter: helpCounter,
                            playedNum: currentQuestionNumber + 1)
        
        var shuffleToSave = 0
        if Game.shared.settings.questionTextShuffeling == 1 { shuffleToSave = 1 }
        var endGameToSave = 0
        if Game.shared.settings.endGame == 1 { endGameToSave = 1 }
        
        let setting = Settings(questionOrder: questionOrder,
                               questionTextShuffeling: shuffleToSave,
                               endGame: endGameToSave)
        
        Game.shared.addRecord(record)
        Game.shared.saveSettings(setting)
    }
    
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


// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate { }
