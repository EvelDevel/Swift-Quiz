
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
    @IBOutlet weak var questionImageHeight: NSLayoutConstraint!
    
    @IBOutlet var answerButtonsCollections: [HalfRoundButton]!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBAction func helpSound(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    
    /// Settings
    private let orderSettings = Game.shared.settings.questionOrder
    private let shuffleSettings = Game.shared.settings.questionTextShuffeling
    private let saveRecordSettings = Game.shared.settings.saveRecord
    private let soundSettings = Game.shared.settings.sound
    private let helpAfterWrongAnswerSetting = Game.shared.settings.helpAfterWrong
    
    private var initialQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var correctAnswer: String = ""
    private var correctAnswerNewPosition = 0
    private var percent: Double = 0
    private var imageName = ""
    private var helpCounter = 0
    private var helpFlag = false
    private var helpAfterWrongAnswerFlag = false
    private var endGameFlag = false
    
    private var shuffledAnswersArray: [String] = []
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        updateQuestion()
        addShadows()
        addButtonShadows()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if endGameFlag == false {
            /// Свернули игру не дойдя до конца
            endGame(scenario: 1)
        }
    }
}


// MARK: Установка и обновление основных игровых параметров
extension GameViewController {
    
    func addQuestionSet() {
        let normal = SelectedTopic.shared.topic.questionSet
        let random = SelectedTopic.shared.topic.questionSet.shuffled()
        if orderSettings == 0 {  initialQuestionSet = normal } else { initialQuestionSet = random }
    }
    
    func updateQuestion() {
        refreshButtonsVisibility()
        setDafaultButtonsColor()
        addQuestionContent()
        updateUI()
    }
    
    func refreshButtonsVisibility() {
        if currentQuestionIndex < initialQuestionSet.count {
            self.optionA.isHidden = false
            self.optionB.isHidden = false
            self.optionC.isHidden = false
            self.optionD.isHidden = false
        }
    }
    
    func setDafaultButtonsColor() {
        addButtonShadows()
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
            settingShuffledAnswers()
        } else if endGameFlag == false {
            /// Кончились вопросы
            endGame(scenario: 2)
        }
    }
    
    func updateUI() {
        helpAfterWrongAnswerFlag = false
        helpFlag = false
        scoreLabel.text = "\(score) | \(updatePercentage())%"
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
            questionImageHeight.constant = 0
            
            if view.frame.size.width <= 320 {
                questionLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
            } else {
                questionLabel.font = UIFont.systemFont(ofSize: 23.0, weight: .light)
            }
        } else {
            questionImageView.image = UIImage(named: image)
            
            if view.frame.size.width <= 320 {
                questionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
                questionImageHeight.constant = 160
            } else {
                questionLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
                questionImageHeight.constant = 180
            }
        }
    }
    
    func setQuestionText() {
        let normal = initialQuestionSet[currentQuestionIndex].question[0]
        let random = initialQuestionSet[currentQuestionIndex].question.shuffled()
        if  shuffleSettings == 1 {
            questionLabel.text = random[0]
        } else {
            questionLabel.text = normal
        }
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
    
    func settingShuffledAnswers() {
        
        /// Установка ответов без анимации и скрытие пустых кнопок
        
        optionA.titleLabel?.text = shuffledAnswersArray[0]
        optionA.setTitle(shuffledAnswersArray[0], for: .normal)
        if shuffledAnswersArray[0] == "" { optionA.isHidden = true }
        
        optionB.titleLabel?.text = shuffledAnswersArray[1]
        optionB.setTitle(shuffledAnswersArray[1], for: .normal)
        if shuffledAnswersArray[1] == "" { optionB.isHidden = true }
        
        optionC.titleLabel?.text = shuffledAnswersArray[2]
        optionC.setTitle(shuffledAnswersArray[2], for: .normal)
        if shuffledAnswersArray[2] == "" { optionC.isHidden = true }
        
        optionD.titleLabel?.text = shuffledAnswersArray[3]
        optionD.setTitle(shuffledAnswersArray[3], for: .normal)
        if shuffledAnswersArray[3] == "" { optionD.isHidden = true }
    }
}


// MARK: Нажатие на кнопку ответа
extension GameViewController {
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswerNewPosition {
            score += 1
            helpAfterWrongAnswerFlag = false
            addGreenShadow(button: sender)
            changeButtonColor(sender: sender, true)
            SoundPlayer.shared.playSound(sound: .answerButtonRight)
        } else {
            addRedShadow(button: sender)
            changeButtonColor(sender: sender, false)
            SoundPlayer.shared.playSound(sound: .answerButtonWrong)
            
            /// Запуск подсказки после неправильного ответа (настройки)
            if helpAfterWrongAnswerSetting == 1 && helpFlag == false  {
                showHelpAfterWrongAnswer()
                helpAfterWrongAnswerFlag = true
            }
        }
        
        if currentQuestionIndex < initialQuestionSet.count && helpAfterWrongAnswerFlag == false {
            currentQuestionIndex += 1
            currentQuestionNumber += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.updateQuestion()
            }
        }
    }
    
    func showHelpAfterWrongAnswer() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let helpView  = mainStoryboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        helpView.delegate = self
        helpView.questionID = initialQuestionSet[currentQuestionIndex].questionId
        
        /// Если не переходим к следующему - засчитываем только 1 подсказку
        if helpFlag == false {
            helpCounter += 1
        }
        pressHelpCounterLabel.text = "\(helpCounter)"
        helpFlag = true
        self.present(helpView, animated: true, completion: nil)
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
            if saveRecordSettings == 1 && currentQuestionIndex > 0 {
                callDelegateAndSaveRecord()
            }
        case 2:
            callDelegateAndSaveRecord()
            showAlert(title: "Вопросы закончились", message: "Ваш счет")
        default:
            print("endGame error")
        }
    }
    
    func callDelegateAndSaveRecord() {
        endGameFlag = true
        delegate?.didEndGame(result: score,
                             totalQuestion: initialQuestionSet.count,
                             percentOfCorrect: updatePercentage(),
                             topic: SelectedTopic.shared.topic.topicName,
                             helpCounter: helpCounter,
                             playedNum: currentQuestionIndex)
        let record = Record(date: Date(),
                            score: score,
                            topic: SelectedTopic.shared.topic.topicName,
                            totalQuestion: initialQuestionSet.count,
                            percentOfCorrectAnswer: updatePercentage(),
                            helpCounter: helpCounter,
                            playedNum: currentQuestionIndex)
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
            /// Если не переходим к следующему - засчитываем только 1 подсказку
            if helpFlag == false {
                helpCounter += 1
            }
            pressHelpCounterLabel.text = "\(helpCounter)"
            helpFlag = true
        }
    }
}


// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate {
    
    func updateAfterHelp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if Game.shared.settings.changeAfterHelp == 0 {
                self.currentQuestionNumber += 1
                self.currentQuestionIndex += 1
                self.updateQuestion()
            }
        }
    }
}


// MARK: Настройка теней и скруглений
extension GameViewController {
    
    /// Черная тень
    func addShadows() {
        /// Тень у блока вопросов
        questionArea.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        questionArea.layer.shadowOpacity = 1
        questionArea.layer.shadowRadius = 5
        questionArea.layer.shadowOffset = CGSize(width: 0, height: 5)
        questionArea.layer.position = questionArea.center
        
        /// Тень прогресс-бара (белого)
        progressWhite.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        progressWhite.layer.shadowOpacity = 1
        progressWhite.layer.shadowRadius = 5
        progressWhite.layer.shadowOffset = CGSize(width: 0, height: 5)
        progressWhite.layer.position = progressWhite.center
    }
    
    func addButtonShadows() {
        for button in answerButtonsCollections {
            /// Тень
            button.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            
            /// Задротское скругление
            button.layer.cornerCurve = .continuous
        }
    }
    
    /// Цветные тени
    func addRedShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.996, green: 0.353, blue: 0.224, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
    func addGreenShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.055, green: 0.8, blue: 0.404, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
}
