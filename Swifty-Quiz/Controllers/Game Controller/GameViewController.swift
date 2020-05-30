
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
    func updateInitialFromGameView()
}

class GameViewController: UIViewController {
    
    /// Settings
    private let orderSettings = Game.shared.settings.questionOrder
    private let shuffleSettings = Game.shared.settings.questionTextShuffeling
    private let saveRecordSettings = Game.shared.settings.saveRecord
    private let soundSettings = Game.shared.settings.sound
    private let helpAfterWrongAnswerSetting = Game.shared.settings.helpAfterWrong
    var weContinueLastGame = false
    
    @IBOutlet var answerButtonsCollection: [HalfRoundButton]!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var helpCounterLabel: UILabel!
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
        setValuesIfWeContinue()
        addQuestionSet()
        updateQuestion()
        shadows.addStaticShadows(questionArea, progressWhite)
        shadows.addButtonShadows(answerButtonsCollection)
    }

    override func viewDidDisappear(_ animated: Bool) {
        /// Свернули игру не доиграв
        /// Сохраняем, если еще не прошло сохранение текущей игры
        /// И если настройка сохранения незавершенных - активна (и ответили хотя бы на 1 вопрос)
        if endGameFlag == false && saveRecordSettings == 1 {
            if currentQuestionIndex > 0 {
                gameEnding(path: 2)
            }
        }
    }
}


// MARK: Установка и обновление основных игровых параметров
extension GameViewController {
    
    func setValuesIfWeContinue() {
        if Game.shared.records.count != 0 {
            if weContinueLastGame == true {
                self.currentQuestionNumber = Game.shared.records[0].playedNum! + 1
                self.currentQuestionIndex = Game.shared.records[0].playedNum!
                self.score = Game.shared.records[0].score!
                self.helpCounter = Game.shared.records[0].helpCounter!
                self.initialQuestionSet = SelectedTopic.shared.topic.questionSet
                if helpCounter != 0 { self.helpCounterLabel.text = "\(helpCounter)" }
            }
        }
    }
    
    func addQuestionSet() {
        let normal = SelectedTopic.shared.topic.questionSet
        let random = SelectedTopic.shared.topic.questionSet.shuffled()
        
        if weContinueLastGame == false {
            if orderSettings == 0 {
                initialQuestionSet = normal
            } else {
                initialQuestionSet = random
            }
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
            gameEnding(path: 1)
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
            /// Увеличиваем счет только если не брали подсказку
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
        helpCounterLabel.text = "\(helpCounter)"
        helpFlag = true
        self.present(helpView, animated: true, completion: nil)
    }
}


// MARK: Завершение игры
extension GameViewController {
    
    func gameEnding(path: Int) {
        switch path {
        case 1:
            callDelegateAndSaveRecord(continueStatus: false)
            updateMessageAndShowAlert()
        case 2:
            callDelegateAndSaveRecord(continueStatus: true)
        default:
            print("gameEnding error")
        }
    }
    
    func callDelegateAndSaveRecord(continueStatus: Bool) {
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
                                playedNum: currentQuestionIndex,
                                continueGameStatus: continueStatus)
        
        if weContinueLastGame {
            Game.shared.replaceRecord(record)
        } else {
            Game.shared.addRecord(record)
        }
        SelectedTopic.shared.addQuestionSet(initialQuestionSet,
                                            topic: SelectedTopic.shared.topic.topicName,
                                            tag: SelectedTopic.shared.topic.topicTag)
        delegate?.updateInitialFromGameView()
    }
    
    func updateMessageAndShowAlert() {
        if updatePercentage() < 35 { message = "Не сдавайтесь, пока результат слабый, но у вас все получится!"
        } else if updatePercentage() < 55 { message = "Достойный результат, но нужно продолжать работать!"
        } else if updatePercentage() < 75 { message = "Уже хорошо! Но вы можете постараться еще лучше!"
        } else { message = "Превосходно! Продолжайте в том же духе и по остальным темам!" }
        showAlert(title: "Ваш счет", message: "\(message)")
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
            helpCounterLabel.text = "\(helpCounter)"
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
