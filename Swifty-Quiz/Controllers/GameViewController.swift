
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
    @IBOutlet weak var progressWhite: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var pressHelpCounterLabel: UILabel!
    @IBOutlet weak var questionArea: UIView!
    @IBOutlet weak var progressBarWhite: UIView!
    
    @IBOutlet var answerButtonsCollections: [HalfRoundButton]!
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
    
    private var initialQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var correctAnswer: String = ""
    private var correctAnswerNewPosition = 0
    private var percent: Double = 0
    private var imageName = ""
    private var helpCounter = 0
    private var endGameFlag = false
    
    private var shuffledAnswersArray: [String] = []
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        updateQuestion()
        addShadows()
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
        for button in answerButtonsCollections {
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9964529872, green: 0.8487327695, blue: 0.225723803, alpha: 1)
        }
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
        progressView.frame.size.width = (progressWhite.frame.size.width / CGFloat(initialQuestionSet.count)) * CGFloat(currentQuestionIndex)
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
        case 1:
            optionA.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionA.setTitleColor(.white, for: .normal)
        case 2:
            optionB.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionB.setTitleColor(.white, for: .normal)
        case 3:
            optionC.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionC.setTitleColor(.white, for: .normal)
        case 4:
            optionD.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionD.setTitleColor(.white, for: .normal)
        default:
            print("We have error with answer button tags")
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


// MARK: Настройка теней и скруглений
extension GameViewController {
    
    func addShadows() {
        for button in answerButtonsCollections {
            
            /// Тень
            button.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 20
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            
            /// Задротское скругление
            button.layer.cornerCurve = .continuous
        }
        
        /// Тень у блока вопросов
        questionArea.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        questionArea.layer.shadowOpacity = 1
        questionArea.layer.shadowRadius = 20
        questionArea.layer.shadowOffset = CGSize(width: 0, height: 5)
        questionArea.layer.position = questionArea.center
        
        /// Тень прогресс-бара (белого)
        progressWhite.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        progressWhite.layer.shadowOpacity = 1
        progressWhite.layer.shadowRadius = 20
        progressWhite.layer.shadowOffset = CGSize(width: 0, height: 5)
        progressWhite.layer.position = progressWhite.center
    }
}
