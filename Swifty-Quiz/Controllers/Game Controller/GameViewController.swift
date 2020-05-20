
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
}

class GameViewController: UIViewController {
    
    @IBOutlet var answerButtonsCollection: [HalfRoundButton]!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
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
    @IBAction func helpSound(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    
    /// Settings
    private let orderSettings = Game.shared.settings.questionOrder
    private let shuffleSettings = Game.shared.settings.questionTextShuffeling
    private let saveRecordSettings = Game.shared.settings.saveRecord
    private let soundSettings = Game.shared.settings.sound
    private let helpAfterWrongAnswerSetting = Game.shared.settings.helpAfterWrong
    
    private let buttonsView = AnswerButtonsView()
    private var initialQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var percent: Double = 0
    private var imageName = ""
    private var helpCounter = 0
    
    /// Flags
    private var helpFlag = false // Предотвращает повторное засчитывание подсказки
    private var helpAfterWrongAnswerFlag = false //
    private var endGameFlag = false // Предотвращает повторное сохранение одного рекорда

    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        updateQuestion()
        addShadows()
        buttonsView.addButtonShadows(answerButtonsCollection)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if endGameFlag == false {
            endGame(scenario: 1) /// Свернули игру не доиграв
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
        /// Восстановление видимости всех кнопок
        buttonsView.refreshButtonsVisibility(currentQuestionIndex, initialQuestionSet.count, answerButtonsCollection)
        /// Устанавливаем дефолтный цвет и тени
        buttonsView.setDefaultButtonsColor(answerButtonsCollection)
        buttonsView.addButtonShadows(answerButtonsCollection)
        
        addQuestionContent()
        updateUI()
    }
    
    func addQuestionContent() {
        if currentQuestionIndex <= initialQuestionSet.count - 1 {
            setQuestionImageAndTextSize()
            setQuestionText()
            
            /// Фиксируем правильный ответ
            buttonsView.saveCorrectAnswerText(currentQuestionIndex, initialQuestionSet)
            /// Перемешиваем позиции вариантов ответа
            buttonsView.shuffleAnswersPositions(currentQuestionIndex, initialQuestionSet)
            /// Устанавливаем ответы на новые позиции
            buttonsView.settingShuffledAnswers(optionA, optionB, optionC, optionD)
            
        } else if endGameFlag == false {
            endGame(scenario: 2) /// Кончились вопросы
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
}


// MARK: Нажатие на кнопку ответа
extension GameViewController {
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == buttonsView.showCorrectPosition() {
            score += 1
            helpAfterWrongAnswerFlag = false
            buttonsView.addGreenShadow(button: sender)
            buttonsView.changeButtonColor(sender: sender, true, optionA, optionB, optionC, optionD)
            SoundPlayer.shared.playSound(sound: .answerButtonRight)
        } else {
            buttonsView.addRedShadow(button: sender)
            buttonsView.changeButtonColor(sender: sender, false, optionA, optionB, optionC, optionD)
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
}
