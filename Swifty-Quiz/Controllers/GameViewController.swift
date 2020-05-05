
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
    
    /// Settings
    private let orderSettings = Game.shared.settings.questionOrder
    private let shuffleSettings = Game.shared.settings.questionTextShuffeling
    private let endGameSettings = Game.shared.settings.endGame
    private let saveRecordSettings = Game.shared.settings.saveRecord
    private let soundSettings = Game.shared.settings.sound
    
    private var initialQuestionSet: [Question] = []     // Исходный массив вопросов (после выбора категории)
    private var currentQuestionNumber: Int = 1          // Текущий номер вопроса в игре
    private var currentQuestionIndex = 0                // Реальный номер этого вопроса в массиве
    private var score: Int = 0                          // Счет, или количество правильных ответов
    private var correctAnswer: String = ""              // Строковый литерал правильного ответа
    private var correctAnswerNewPosition = 0            // Новая позиция правильного ответа после shuffle()
    private var percent: Double = 0                     // Процент правильных ответов
    private var imageName = ""                          // Имя изображения
    private var helpCounter = 0                         // Счетчик использованных подсказок
    private var endGameFlag = false                     // Флаг для сценария конца игры
    
    private var shuffledAnswersArray: [String] = []     // Массив перемешанных вариантов ответа
    weak var delegate: GameViewControllerDelegate?      // Экземпляр делегата
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        updateQuestion()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if endGameFlag == false {
            endGame(scenario: 1)
        }
    }
}


// MARK: Звуки нажатия кнопок игрового экрана
extension GameViewController {
    
    @IBAction func helpSound(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    @IBAction func gameButtonTapped(_ sender: Any) { SoundPlayer.shared.playSound(sound: .answerButtons) }
}


// MARK: Установка и обновление основных игровых параметров
extension GameViewController {
    
    func addQuestionSet() {
        let normal = SelectedTopic.shared.topic.questionSet
        let random = SelectedTopic.shared.topic.questionSet.shuffled()
        if orderSettings == 0 {  initialQuestionSet = normal } else { initialQuestionSet = random }
    }
    
    func updateQuestion() {
        setDafaultButtonsColor()
        addQuestionContent()
        updateUI()
    }
    
    func setDafaultButtonsColor() {
        optionA.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionB.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionC.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
        optionD.backgroundColor = #colorLiteral(red: 0.2880442441, green: 0.5009066463, blue: 0.7458965778, alpha: 1)
    }
    
    func addQuestionContent() {
        if currentQuestionIndex <= initialQuestionSet.count - 1 {
            setQuestionImageAndTextSize()
            setQuestionText()
            saveCorrectAnswerText()
            shuffleAnswersPositions()
            placeShuffledAnswers()
        } else if endGameFlag == false {
            endGame(scenario: 2)
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


// MARK: Установка контента вопросов (addQuestionContent)
extension GameViewController {
    
    func setQuestionImageAndTextSize() {
        let image = initialQuestionSet[currentQuestionIndex].image
        if  image == "" {
            questionImageView.image = nil
            questionLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .light)
        } else {
            questionImageView.image = UIImage(named: image)
            questionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        }
    }
    
    func setQuestionText() {
        let normal = initialQuestionSet[currentQuestionIndex].question[0]
        let random = initialQuestionSet[currentQuestionIndex].question.shuffled()
        if  shuffleSettings == 1 { questionLabel.text = random[0] } else { questionLabel.text = normal }
    }
    
    func saveCorrectAnswerText() {
        switch initialQuestionSet[currentQuestionIndex].correctAnswer {
        case 1: correctAnswer = initialQuestionSet[currentQuestionIndex].optionA
        case 2: correctAnswer = initialQuestionSet[currentQuestionIndex].optionB
        case 3: correctAnswer = initialQuestionSet[currentQuestionIndex].optionC
        case 4: correctAnswer = initialQuestionSet[currentQuestionIndex].optionD
        default: print("Error with correct placing answers")
        }
    }
    
    func shuffleAnswersPositions() {
        var tempAnswersArray: [String] = []
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionA)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionB)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionC)
        tempAnswersArray.append(initialQuestionSet[currentQuestionIndex].optionD)
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
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswerNewPosition {
            score += 1
            changeButtonColor(sender: sender, true)
        } else {
            changeButtonColor(sender: sender, false)
    
            if endGameSettings == 1 {
                endGame(scenario: 3)
            }
        }
        if currentQuestionIndex < initialQuestionSet.count {
            currentQuestionIndex += 1
            currentQuestionNumber += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.updateQuestion()
            }
        }
    }
    
    func changeButtonColor(sender: UIButton, _ answerIsCorrect: Bool) {
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
    func endGame(scenario: Int) {
        switch scenario {
        case 1:
            // Свернули игру не дойдя до конца
            if Game.shared.settings.saveRecord == 1 {
                callDelegate()
                saveRecord()
            }
        case 2:
            /// Кончились вопросы
            callDelegate()
            saveRecord()
            showAlert(title: "Вопросы закончились", message: "Ваш счет")
        case 3:
            /// Опция в настройках "завершать игру"
            callDelegate()
            saveRecord()
            showAlert(title: "Ответ неверный", message: "Ваш счет")
        default:
            print("we have a problem with scenarios of game ending")
        }
    }
    
    func callDelegate() {
        endGameFlag = true
        delegate?.didEndGame(result: score, totalQuestion: initialQuestionSet.count, percentOfCorrect: updatePercentage(),
                             topic: SelectedTopic.shared.topic.topicName, helpCounter: helpCounter, playedNum: currentQuestionIndex)
    }
    
    func saveRecord() {
        let record = Record(date: Date(), score: score, topic: SelectedTopic.shared.topic.topicName,
                            totalQuestion: initialQuestionSet.count, percentOfCorrectAnswer: updatePercentage(),
                            helpCounter: helpCounter, playedNum: currentQuestionIndex)
        Game.shared.addRecord(record)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "\(title)", message: "\(message): \(score)", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Перезапустить", style: .default, handler: { action in self.restartGame() })
        let quitAction = UIAlertAction(title: "Выйти", style: .default, handler: { action in self.dismiss(animated: true, completion: nil) })
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        present(alert, animated: true, completion: nil)
        currentQuestionNumber -= 1
    }
    
    func restartGame() {
        endGameFlag = false
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
