
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: class {
    func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double, topic: String, helpCounter: Int, playedNum: Int)
    func updateInitialView()
}

class GameViewController: UIViewController {
    
    /// Settings
    private let orderSetting =      Game.shared.settings.questionOrder
    private let shuffleSetting =    Game.shared.settings.questionTextShuffeling
    private let saveSetting =       Game.shared.settings.saveRecord
    private let helpSetting =       Game.shared.settings.helpAfterWrong
    
    @IBOutlet var answerButtonsCollection: [UIButton]!
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
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionImageHeight: NSLayoutConstraint!
    @IBAction func helpSound(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    @IBOutlet var GameComtrollerViews: [UIView]!
    
    private let currentTag = SelectedTopic.shared.topic.topicTag
    private let gameHelper = GameHelper()
    private let buttonsView = AnswerButtonsView()
    private let shadows = ShadowsHelper()
    private var localQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var imageName = ""
    private var helpCounter = 0
    private var message = ""
    private var answerPressed = false
    private var alreadyTappedIncorrect: [Int] = []
    var weContinueLastGame = false
    
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
        addShadows()
        showAlertIfNeeded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        /// Свернули игру не доиграв. Сохраняем:
        /// - Если еще не прошло сохранение текущей игры (Многократное прожатие ответа на последний вопрос)
        /// - Если активна настройка сохранения незавершенных игр
        /// - Ответили хотя бы на 1 вопрос
        if endGameFlag == false && saveSetting == 1 {
            if currentQuestionIndex > 0 {
                gameEnding(path: 2)
            }
        }
        /// Всегда при закрытии экрана вызываем обновление initialView
        delegate?.updateInitialView()
    }
    
    func addShadows() {
        shadows.addStaticShadows(GameComtrollerViews)
        shadows.addButtonShadows(answerButtonsCollection)
    }
    
    func showAlertIfNeeded() {
        gameHelper.showAlertIfNeeded(weContinueLastGame, self)
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
                self.localQuestionSet = SelectedTopic.shared.topic.continueQuestionSet
                if helpCounter != 0 { self.helpCounterLabel.text = "\(helpCounter)" }
            }
        }
    }
    
    func addQuestionSet() {
        let normal = SelectedTopic.shared.topic.questionSet
        let random = SelectedTopic.shared.topic.questionSet.shuffled()
        
        /// В этот момент мы передаем локальному массиву с вопросами исходный массив
        /// Который мы добавили в синглтон при выборе категории
        /// Далее по контроллеру изменяем локальный массив, не трогая порядок вопросов исходного
        if weContinueLastGame == false {
            if orderSetting == 0 {
                localQuestionSet = normal
            } else {
                localQuestionSet = random
            }
        }
    }
    
    func updateQuestion() {
        buttonsView.refreshButtonsVisibility(currentQuestionIndex, localQuestionSet.count, answerButtonsCollection)
        buttonsView.setDefaultButtonsColor(answerButtonsCollection)
        shadows.addButtonShadows(answerButtonsCollection)
        addQuestionContent()
        updateUI()
        answerPressed = false
        alreadyTappedIncorrect = []
    }
    
    /// Установка контента
    func addQuestionContent() {
        if currentQuestionIndex <= localQuestionSet.count - 1 {
            buttonsView.makeCorrectButtonsSet(currentQuestionIndex, localQuestionSet, optionA, optionB, optionC, optionD)
            gameHelper.setQuestionImageAndTextSizes(localQuestionSet, currentQuestionIndex, questionImageView,
                                                   questionImageHeight, view, questionLabel, answerButtonsCollection)
            gameHelper.setQuestionText(localQuestionSet, shuffleSetting, currentQuestionIndex, questionLabel)
        } else if endGameFlag == false {
            gameEnding(path: 1)
        }
    }
    
    func updateUI() {
        dontUpdateQuestionFlag = false
        helpFlag = false
        scoreLabel.text = "\(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(localQuestionSet.count)"
        progressView.frame.size.width = (progressWhite.frame.size.width / CGFloat(localQuestionSet.count)) * CGFloat(currentQuestionIndex)
    }
    
    func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.localQuestionSet.count) * 100))) ?? 0
    }
}


// MARK: Нажатие на ответ
extension GameViewController {

    @IBAction func answerPressed(_ sender: UIButton) {
        /// Первая проверка: Предотвращаем двойное нажатие на разные кнопки
        if answerPressed == false {
            if sender.tag == buttonsView.showCorrectPosition() {
                
                /// Когда ответили правильно
                /// Увеличиваем счет только если не брали подсказку
                if helpFlag == false { score += 1 }
                dontUpdateQuestionFlag = false
                shadows.addGreenShadow(button: sender)
                buttonsView.changeButtonColor(sender: sender, true, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .answerButtonRight)
                answerPressed = true
            } else {
                /// Когда ответили неправильно
                shadows.addRedShadow(button: sender)
                buttonsView.changeButtonColor(sender: sender, false, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .answerButtonWrong)
                answerPressed = true
                
                /// Если активирована настройка "выводить подсказку"
                if helpSetting == 1 {
                    /// Если мы еще не нажимали на данный ответ
                    if alreadyTappedIncorrect.contains(sender.tag) == false {
                        /// Добавляем нажатую кнопку в "массив уже нажатых ответов"
                        /// Отсекаем повторный вызов подсказок с одной клавиши
                        alreadyTappedIncorrect.append(sender.tag)
                        /// Выводим подсказку
                        /// Обнуляем в делегате "нажатость" ответа (refreshTappedAnswerStatus())
                        showHelpAfterWrongAnswer()
                    } else {
                        /// Если мы уже нажимали кнопку
                        /// Просто обнуляем нажатость ответа, без подсказки
                        answerPressed = false
                    }
                    /// Флаг "не обновлять вопрос", который используется в проверке ниже
                    dontUpdateQuestionFlag = true
                }
            }
            
            /// Обновляем вопрос, показатели, и переходим дальше, если:
            /// - еще остались вопросы в массиве
            /// - мы не выводили подсказку "после неправильного ответа" (настройки)
            if currentQuestionIndex < localQuestionSet.count && dontUpdateQuestionFlag == false {
                currentQuestionIndex += 1
                currentQuestionNumber += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.updateQuestion()
                }
            }
        }
    }
    
    /// Запускаем подсказку после неправильного ответа
    /// Попадаем сюда, только если активирована соответствующая настройка
    func showHelpAfterWrongAnswer() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let helpView  = mainStoryboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        helpView.delegate = self
        helpView.questionID = localQuestionSet[currentQuestionIndex].questionId
    
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
            /// Доиграли до конца
            callDelegateAndSaveRecord(continueStatus: false)
            showAlert(title: "Ваш счет", message: "\(gameHelper.updatedAlertMessage(score: updatePercentage()))")
        case 2:
            /// Преждевременно закончили игру
            callDelegateAndSaveRecord(continueStatus: true)
        default:
            print("gameEnding error")
        }
    }
    
    func callDelegateAndSaveRecord(continueStatus: Bool) {
        endGameFlag = true
        delegate?.didEndGame(   result: score,
                                totalQuestion: localQuestionSet.count,
                                percentOfCorrect: updatePercentage(),
                                topic: SelectedTopic.shared.topic.topicName,
                                helpCounter: helpCounter,
                                playedNum: currentQuestionIndex)

        let record = Record(    date: Date(),
                                score: score,
                                topic: SelectedTopic.shared.topic.topicName,
                                totalQuestion: localQuestionSet.count,
                                percentOfCorrectAnswer: updatePercentage(),
                                helpCounter: helpCounter,
                                playedNum: currentQuestionIndex,
                                continueGameStatus: continueStatus)
        
        if weContinueLastGame {
            Game.shared.replaceRecord(record)
        } else {
            Game.shared.addRecord(record)
        }
        /// Отдельно сохраняется локальный массив (который может быть зашафлен)
        /// Отдельно сохраняется исходный - для последующих игр и возможных изменений настроек
        /// При продолжении игры, в коде выше загружается именно локальный, на котором остановились
        SelectedTopic.shared.addRandomSetToContinue(localQuestionSet)
        SelectedTopic.shared.addQuestionSet(SelectedTopic.shared.topic.questionSet,
                                            topic: SelectedTopic.shared.topic.topicName,
                                            tag: SelectedTopic.shared.topic.topicTag)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "\(title): \(score)", message: "\(message)", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Перезапустить", style: .default, handler: { action in self.restartGame() })
        let quitAction = UIAlertAction(title: "Выйти", style: .default, handler: { action in self.quitGame() })
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        present(alert, animated: true, completion: nil)
        currentQuestionNumber -= 1
    }
    
    func quitGame() {
        gameHelper.refreshRandomSets(tag: currentTag)
        self.dismiss(animated: true, completion: nil)
    }
    
    func restartGame() {
        endGameFlag = false
        weContinueLastGame = false
        helpCounter = 0
        helpCounterLabel.text = ""
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
            helpView.questionID = localQuestionSet[currentQuestionIndex].questionId
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
    func refreshTappedAnswerStatus() {
        self.answerPressed = false
    }
}
