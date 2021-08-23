
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(result: Int,
                    totalQuestion: Int,
                    percentOfCorrect: Double,
                    topic: String,
                    helpCounter: Int,
                    playedNum: Int)
	func showReviewRequest()
    func updateInitialView()
}

class GameViewController: UIViewController {
	
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var headerTopMargin: NSLayoutConstraint!
	
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
    
    private let gameHelper = GameHelper()
    private let buttonsView = AnswerButtonsView()
    private let shadows = Shadow()
    private var localQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var helpCounter = 0
    private var alreadyTappedIncorrect: [Int] = []
    private var gameHistory: [GameHistory] = []
    
    /// Settings
    private let questionOrderSetting = Game.shared.settings.questionOrder
    private let questionTextShuffelingSetting = Game.shared.settings.questionTextShuffeling
    private let helpAfterWrongAnswerSetting = Game.shared.settings.helpAfterWrong
    
    /// Flags
    private var weDidTakeHelp = false // Предотвращает повторное засчитывание подсказки
    private var dontUpdateQuestionFlag = false // Предотвращает updateQuestion, когда это не нужно
    private var endGameFlag = false // Предотвращает повторное сохранение одного рекорда
    private var answerPressed = false // Уже нажали один ответ (чтобы второе нажатие не срабатывало)
    private var weDidGetAutoHelp = false // Пользователь получил автоматическую подсказку (настройки)
    var weContinueLastGame = false // Продолжаем игру или играем новую
    
    weak var delegate: GameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpValuesIfWeContinue()
        addQuestionSet()
        updateQuestion()
        addShadows()
        showAlertIfNeeded()
    }
    
    /// Swipe-down, сохраняем если не запрашивалось сохранение текущей игры и ответили хотя-бы на один вопрос
    override func viewDidDisappear(_ animated: Bool) {
        if endGameFlag == false && currentQuestionIndex > 0 { gameEnding(path: 2) }
        delegate?.updateInitialView()
		delegate?.showReviewRequest()
    }
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			headerTopMargin.constant = 0
		}
	}
	/// < 13.0 iOS Navigation
	@IBAction func dismissGame(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .menuMainButton)
		dismiss(animated: true, completion: nil)
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
    
    /// Установка значений при продолжении
    func setUpValuesIfWeContinue() {
        if Game.shared.records.count != 0 {
            if weContinueLastGame {
                self.localQuestionSet = SelectedTopic.shared.topic.continueQuestionSet
                self.currentQuestionNumber = Game.shared.records[0].playedNum! + 1
                self.weDidTakeHelp = Game.shared.records[0].helpFlag!
                self.gameHistory = Game.shared.records[0].gameHistory!
                self.currentQuestionIndex = Game.shared.records[0].playedNum!
                self.score = Game.shared.records[0].score!
                self.helpCounter = Game.shared.records[0].helpCounter!
                if helpCounter != 0 { self.helpCounterLabel.text = "\(helpCounter)" }
            }
        }
    }
    
    /// Загружаем сет вопросов для новой игры
    func addQuestionSet() {
        if !weContinueLastGame {
            if questionOrderSetting == 0 {
                localQuestionSet = SelectedTopic.shared.topic.questionSet
            } else {
                localQuestionSet = SelectedTopic.shared.topic.questionSet.shuffled()
            }
        }
    }
    
    /// Апдейт вопроса
    func updateQuestion() {
        /// У последнего вопроса не обновляем интерфейс
        if currentQuestionIndex < localQuestionSet.count {
            buttonsView.refreshButtonsVisibility(currentQuestionIndex, localQuestionSet.count, answerButtonsCollection)
            buttonsView.setDefaultButtonsColor(answerButtonsCollection)
            shadows.addButtonShadows(answerButtonsCollection)
        }
        answerPressed = false
        dontUpdateQuestionFlag = false
        weDidGetAutoHelp = false
        weDidTakeHelp = false
        alreadyTappedIncorrect = []
        addQuestionContent()
        updateUI()
    }
    
    /// Установка контента
    func addQuestionContent() {
        if currentQuestionIndex <= localQuestionSet.count - 1 {
            buttonsView.makeCorrectButtonsSet(currentQuestionIndex, localQuestionSet, optionA, optionB, optionC, optionD)
            gameHelper.setQuestionImageAndTextSizes(localQuestionSet, currentQuestionIndex, questionImageView,
                                                   questionImageHeight, view, questionLabel, answerButtonsCollection)
            gameHelper.setQuestionText(localQuestionSet, questionTextShuffelingSetting, currentQuestionIndex, questionLabel)
        } else if endGameFlag == false {
            gameEnding(path: 1)
        }
    }
    
    /// Обновляем прогресс
    func updateUI() {
        scoreLabel.text = "\(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(localQuestionSet.count)"
        progressView.frame.size.width = ((view.frame.size.width - 40) / CGFloat(localQuestionSet.count)) * CGFloat(currentQuestionIndex)
    }
    func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.localQuestionSet.count) * 100))) ?? 0
    }
}


// MARK: Нажатие на ответ
extension GameViewController {

    @IBAction func answerPressed(_ sender: UIButton) {
        if answerPressed == false {
            
            /// Как только нажали, до выполнения каких либо манипуляций с ответом и флагами...
            /// записываем вопрос и ответ в историю (правильность будет определяться уже после, внутри контроллера истории).
            /// Это необходимо для того, чтобы у нас правильно отрабатывали флаги и рекорд не засчитывался многократно или некорректно
            if weDidTakeHelp == false {
                gameHistory.append(GameHistory(question: localQuestionSet[currentQuestionIndex].question[0],
                                               correctAnswer: localQuestionSet[currentQuestionIndex].optionA,
                                               userAnswer: buttonsView.showFinalButtonsSet()[sender.tag - 1],
                                               questionId: localQuestionSet[currentQuestionIndex].questionId,
                                               image: localQuestionSet[currentQuestionIndex].image,
											   helpText: localQuestionSet[currentQuestionIndex].helpText))
            }
            
            /// Далее работа непосредственно внутри контроллера
            if sender.tag == buttonsView.showCorrectPosition() {
                if weDidTakeHelp == false { score += 1 }
                shadows.addGreenShadow(button: sender)
                buttonsView.changeButtonColor(sender: sender, true, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .correctAnswer)
                dontUpdateQuestionFlag = false
                answerPressed = true
            } else {
                shadows.addRedShadow(button: sender)
                buttonsView.changeButtonColor(sender: sender, false, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .error)
                answerPressed = true
                
                /// Показываем подсказку после неправильного
                /// Если активна настройка
                if helpAfterWrongAnswerSetting == 1 {
                    if alreadyTappedIncorrect.contains(sender.tag) == false {
                        alreadyTappedIncorrect.append(sender.tag)
                        showHelpAfterWrongAnswer()
                    } else {
                        answerPressed = false
                    }
                    dontUpdateQuestionFlag = true
                }
            }
            
            /// Обновляем вопрос, показатели, и переходим дальше, если:
            /// Остались вопросы в массиве, не выводили авто-подсказку (настройки)
            if currentQuestionIndex < localQuestionSet.count && dontUpdateQuestionFlag == false {
                currentQuestionIndex += 1
                currentQuestionNumber += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.updateQuestion()
                }
            }
        }
    }
    
    /// Запуск подсказки после неправильного ответа
    func showHelpAfterWrongAnswer() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let helpView  = mainStoryboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        helpView.delegate = self
        helpView.questionID = localQuestionSet[currentQuestionIndex].questionId
        if weDidTakeHelp == false { helpCounter += 1 }
        helpCounterLabel.text = "\(helpCounter)"
        weDidTakeHelp = true
        weDidGetAutoHelp = true
        self.present(helpView, animated: true, completion: nil)
    }
}


// MARK: Завершение игры
extension GameViewController {
    
    func gameEnding(path: Int) {
        switch path {
        case 1: /// Доиграли до конца
            callDelegateAndSaveRecord(continueStatus: false, autoHelp: weDidGetAutoHelp)
            showAlert(title: "Ваш счет", message: "\(gameHelper.updatedAlertMessage(score: updatePercentage()))")
        case 2: /// Преждевременно закончили игру
            callDelegateAndSaveRecord(continueStatus: true, autoHelp: weDidGetAutoHelp)
        default: print("gameEnding error")
        }
    }
    
    func callDelegateAndSaveRecord(continueStatus: Bool, autoHelp: Bool) {
        var continueStatus = continueStatus
        endGameFlag = true
        
        /// Если была автоподсказка или мы брали сами + текущий вопрос НЕ является последним
        /// Прибавляем индекс (чтобы при продолжении пойти со следующего) и сбрасываем флаг подсказки
        /// Если вопрос последний - убираем статус возможности продолжать игру
        if weDidGetAutoHelp || weDidTakeHelp {
            if currentQuestionNumber < localQuestionSet.count {
                currentQuestionIndex = currentQuestionIndex + 1
                weDidTakeHelp = false
            } else {
                continueStatus = false
            }
        }
        
        delegate?.didEndGame(
            result: score,
            totalQuestion: localQuestionSet.count,
            percentOfCorrect: updatePercentage(),
            topic: SelectedTopic.shared.topic.topicName,
            helpCounter: helpCounter,
            playedNum: currentQuestionIndex
        )

        let record = Record(
            date: Date(),
            score: score,
            topic: SelectedTopic.shared.topic.topicName,
            totalQuestion: localQuestionSet.count,
            percentOfCorrectAnswer: updatePercentage(),
            helpCounter: helpCounter,
            playedNum: currentQuestionIndex,
            continueGameStatus: continueStatus,
            gameHistory: gameHistory,
            helpFlag: weDidTakeHelp
        )
        
        // Записываем рекорд, или подменяем прошлый, если продолжали
        if weContinueLastGame {
            Game.shared.replaceRecord(record)
        } else {
            Game.shared.addRecord(record)
        }
        
        // Сохраняем текущую версию приложения (отслеживаем обновления)
        let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        Game.shared.saveAppVersion(version: currentAppVersion)
        
        /// Отдельно сохраняется локальный массив (который может быть зашафлен)
        /// Отдельно сохраняется исходный - для последующих игр и возможных изменений настроек
        /// При продолжении игры, в коде выше загружается именно локальный, на котором остановились
        SelectedTopic.shared.saveShuffledSet(localQuestionSet)
        
        SelectedTopic.shared.saveQuestionSet(
            SelectedTopic.shared.topic.questionSet,
            topic: SelectedTopic.shared.topic.topicName,
            tag: SelectedTopic.shared.topic.topicTag
        )
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
        gameHelper.refreshRandomSet(tag: SelectedTopic.shared.topic.topicTag)
        self.dismiss(animated: true, completion: nil)
    }
    
    func restartGame() {
        weContinueLastGame = false
        helpCounterLabel.text = ""
        currentQuestionNumber = 1
        weDidGetAutoHelp = false
        currentQuestionIndex = 0
        weDidTakeHelp = false
        endGameFlag = false
        gameHistory = []
        updateQuestion()
        helpCounter = 0
        score = 0
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
            if weDidTakeHelp == false {
                helpCounter += 1
                
                /// Сохраняем вопрос в историю после того, как взяли подсказку
                /// Так же как и подсказку - записываем всего один раз
                gameHistory.append(
                    GameHistory(
                        question: localQuestionSet[currentQuestionIndex].question[0],
                        correctAnswer: localQuestionSet[currentQuestionIndex].optionA,
                        userAnswer: "Подсказка",
                        questionId: localQuestionSet[currentQuestionIndex].questionId,
                        image: localQuestionSet[currentQuestionIndex].image,
                        helpText: localQuestionSet[currentQuestionIndex].helpText
                    )
                )
            }
            helpCounterLabel.text = "\(helpCounter)"
            weDidTakeHelp = true
        }
    }
}


// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate {
    
    func updateAfterHelp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if Game.shared.settings.changeAfterHelp == 1 {
                self.currentQuestionNumber += 1
                self.currentQuestionIndex += 1
                self.weDidGetAutoHelp = false
                self.weDidTakeHelp = false
                self.updateQuestion()
            }
        }
    }
    
    func refreshTappedAnswerStatus() {
        self.answerPressed = false
    }
}
