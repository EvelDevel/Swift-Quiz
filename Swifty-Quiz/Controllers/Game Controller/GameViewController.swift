
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
}

class GameViewController: UIViewController {
    
    /// Settings
    private let orderSettings = Game.shared.settings.questionOrder
    private let shuffleSettings = Game.shared.settings.questionTextShuffeling
    private let saveRecordSettings = Game.shared.settings.saveRecord
    private let soundSettings = Game.shared.settings.sound
    private let helpAfterWrongAnswerSetting = Game.shared.settings.helpAfterWrong
    
    @IBOutlet var answerButtonsCollection: [HalfRoundButton]!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pressHelpCounterLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressWhite: UIView!
    @IBOutlet weak var questionArea: UIView!
    @IBOutlet weak var progressBarWhite: UIView!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionImageHeight: NSLayoutConstraint!
    @IBAction func helpSound(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    
    private let buttonsView = AnswerButtonsView()
    private let shadows = GameViewShadows()
    private var initialQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var imageName = ""
    private var helpCounter = 0
    private var message = ""
    
    /// Flags
    private var helpFlag = false // Предотвращает повторное засчитывание подсказки
    private var dontUpdateQuestionFlag = false // Предотвращает updateQuestion, когда это не нужно
    private var endGameFlag = false // Предотвращает повторное сохранение одного рекорда

    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionSet()
        updateQuestion()
        shadows.addStaticShadows(questionArea, progressWhite)
        shadows.addButtonShadows(answerButtonsCollection)
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
        if orderSettings == 0 {
            initialQuestionSet = normal
        } else {
            initialQuestionSet = random
        }
    }
    
    func updateQuestion() {
        buttonsView.refreshButtonsVisibility(currentQuestionIndex, initialQuestionSet.count, answerButtonsCollection)
        buttonsView.setDefaultButtonsColor(answerButtonsCollection)
        shadows.addButtonShadows(answerButtonsCollection)
        addQuestionContent()
        updateUI()
    }
    
    func addQuestionContent() {
        if currentQuestionIndex <= initialQuestionSet.count - 1 {
            setQuestionImageAndTextSize()
            setQuestionText()
            buttonsView.saveCorrectAnswerText(currentQuestionIndex, initialQuestionSet)
            buttonsView.shuffleAnswersPositions(currentQuestionIndex, initialQuestionSet)
            buttonsView.setShuffledAnswers(optionA, optionB, optionC, optionD)
        } else if endGameFlag == false {
            endGame(scenario: 2) /// Кончились вопросы
        }
    }
    
    func updateUI() {
        dontUpdateQuestionFlag = false
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


// MARK: Нажатие на ответ
extension GameViewController {
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == buttonsView.showCorrectPosition() {
            if helpFlag == false {
                score += 1
            }
            dontUpdateQuestionFlag = false
            shadows.addGreenShadow(button: sender)
            buttonsView.changeButtonColor(sender: sender, true, optionA, optionB, optionC, optionD)
            SoundPlayer.shared.playSound(sound: .answerButtonRight)
        } else {
            shadows.addRedShadow(button: sender)
            buttonsView.changeButtonColor(sender: sender, false, optionA, optionB, optionC, optionD)
            SoundPlayer.shared.playSound(sound: .answerButtonWrong)
            
            /// Запуск подсказки после неправильного ответа (настройки)
            /// - запускаем функцию вызова подсказки
            /// - запрещаем фоном обновлять вопрос и переходить дальше
            /// - (это произойдет после ухода с экрана подсказки, если активирована такая настройка)
            if helpAfterWrongAnswerSetting == 1 {
                showHelpAfterWrongAnswer()
                dontUpdateQuestionFlag = true
            }
        }
        /// Обновляем вопрос, показатели, и переходим дальше, если:
        /// - еще остались вопросы в массиве
        /// - мы не выводили подсказку "после неправильного ответа" (настройки)
        if currentQuestionIndex < initialQuestionSet.count && dontUpdateQuestionFlag == false {
            currentQuestionIndex += 1
            currentQuestionNumber += 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.updateQuestion()
            }
        }
    }
    
    /// Запускаем подсказку после неправильного ответа
    /// Попадаем сюда, только если активирована такая настройка
    func showHelpAfterWrongAnswer() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let helpView  = mainStoryboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        helpView.delegate = self
        helpView.questionID = initialQuestionSet[currentQuestionIndex].questionId
    
        if helpFlag == false { // отключаем многократное засчитывание
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
            if saveRecordSettings == 1 && currentQuestionIndex > 0 { callDelegateAndSaveRecord() }
        case 2:
            callDelegateAndSaveRecord()
            updateMessageAndShowAlert()
        default: print("endGame error")
        }
    }
    
    func updateMessageAndShowAlert() {
        if updatePercentage() < 35 { message = "Не сдавайтесь, пока результат слабый, но у вас все получится!"
        } else if updatePercentage() < 55 { message = "Достойный результат, но нужно продолжать работать!"
        } else if updatePercentage() < 75 { message = "Уже хорошо! Но вы можете постараться еще лучше!"
        } else { message = "Превосходно! Продолжайте в том же духе и по остальным темам!" }
        showAlert(title: "Ваш счет", message: "\(message)")
    }
    
    func callDelegateAndSaveRecord() {
        endGameFlag = true
        delegate?.didEndGame(   result: score,
                                totalQuestion: initialQuestionSet.count,
                                percentOfCorrect: updatePercentage(),
                                topic: SelectedTopic.shared.topic.topicName,
                                helpCounter: helpCounter,
                                playedNum: currentQuestionIndex)
        let record = Record(    date: Date(),
                                score: score,
                                topic: SelectedTopic.shared.topic.topicName,
                                totalQuestion: initialQuestionSet.count,
                                percentOfCorrectAnswer: updatePercentage(),
                                helpCounter: helpCounter,
                                playedNum: currentQuestionIndex)
        Game.shared.addRecord(record)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "\(title): \(score)", message: "\(message)", preferredStyle: .alert)
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
