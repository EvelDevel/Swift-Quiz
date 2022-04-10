
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(_ result: GameResult)
	func showReviewRequest()
    func updateInitialView()
}

class GameViewController: UIViewController {
	
	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var headerTopMargin: NSLayoutConstraint!
	
	@IBOutlet private var answerButtonsCollection: [UIButton]!
    @IBOutlet private weak var optionA: UIButton!
    @IBOutlet private weak var optionB: UIButton!
    @IBOutlet private weak var optionC: UIButton!
    @IBOutlet private weak var optionD: UIButton!
    @IBOutlet private weak var questionCounterLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var helpCounterLabel: UILabel!
    @IBOutlet private weak var progressView: UIView!
    @IBOutlet private weak var progressWhite: UIView!
    @IBOutlet private weak var questionArea: UIView!
    @IBOutlet private weak var questionImageView: UIImageView!
    @IBOutlet private weak var questionImageHeight: NSLayoutConstraint!

    @IBOutlet private var GameComtrollerViews: [UIView]!
    
    private let gameHelper = GameHelper()
    private let buttons = AnswerButtonsView()
    private var localQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var helpCounter = 0
    private var alreadyTappedIncorrect: [Int] = []
    private var gameHistory: [GameHistory] = []
    
    private let questionOrderSetting = Game.shared.settings.questionOrder
    private let shouldShowAutoHelp = Game.shared.settings.helpAfterWrong
    
    private var weDidTakeHelp = false // Предотвращает повторное засчитывание подсказки
    private var dontUpdateQuestionFlag = false // Предотвращает updateQuestion, когда это не нужно
    private var endGameFlag = false // Предотвращает повторное сохранение одного рекорда
    private var answerPressed = false // Уже нажали один ответ (чтобы второе нажатие не срабатывало)
    private var weDidGetAutoHelp = false // Пользователь получил автоматическую подсказку (настройки)
    var weContinueLastGame = false // Продолжаем игру или играем новую
    
    weak var delegate: GameViewControllerDelegate?
    
    @IBAction private func helpSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        /// Swipe-down, сохраняем если не запрашивалось сохранение текущей игры
        /// и ответили хотя-бы на один вопрос
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
	@IBAction private func dismissGame(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
		dismiss(animated: true, completion: nil)
	}
}


// MARK: Main
extension GameViewController {
    
    private func setup() {
        setUpValuesIfWeContinue()
        addQuestionSet()
        updateQuestion()
        addShadows()
        showAlertIfNeeded()
    }
    
    func addShadows() {
        Shadow().addStaticShadows(GameComtrollerViews)
        Shadow().addButtonShadows(answerButtonsCollection)
    }
    
    func showAlertIfNeeded() {
        gameHelper.showAlertIfNeeded(weContinueLastGame, self)
    }
}


// MARK: Установка и обновление основных игровых параметров
extension GameViewController {
    
    /// Установка значений при продолжении
    private func setUpValuesIfWeContinue() {
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
    private func addQuestionSet() {
        if !weContinueLastGame {
            if questionOrderSetting == 0 {
                localQuestionSet = SelectedTopic.shared.topic.questionSet
            } else {
                localQuestionSet = SelectedTopic.shared.topic.questionSet.shuffled()
            }
        }
    }
    
    /// Апдейт вопроса
    private func updateQuestion() {
        /// У последнего вопроса не обновляем интерфейс
        if currentQuestionIndex < localQuestionSet.count {
            buttons.refreshButtonsVisibility(currentQuestionIndex, localQuestionSet.count, answerButtonsCollection)
            buttons.setDefaultButtonsColor(answerButtonsCollection)
            Shadow().addButtonShadows(answerButtonsCollection)
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
    private func addQuestionContent() {
        if currentQuestionIndex <= localQuestionSet.count - 1 {
            buttons.makeCorrectButtonsSet(
                currentQuestionIndex,
                localQuestionSet,
                optionA,
                optionB,
                optionC,
                optionD
            )
            
            gameHelper.setQuestionImageAndTextSizes(
                localQuestionSet,
                currentQuestionIndex,
                questionImageView,
                questionImageHeight,
                view,
                questionLabel,
                answerButtonsCollection
            )
            
            questionLabel.text = gameHelper.setQuestionText(
                localQuestionSet,
                currentQuestionIndex
            )
            
        } else if endGameFlag == false {
            gameEnding(path: 1)
        }
    }
    
    /// Обновляем прогресс
    private func updateUI() {
        scoreLabel.text = "\(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(localQuestionSet.count)"
        progressView.frame.size.width = ((view.frame.size.width - 40) / CGFloat(localQuestionSet.count)) * CGFloat(currentQuestionIndex)
    }
    
    private func updatePercentage() -> Double {
        return Double(String(format: "%.1f", (Double(self.score) / Double(self.localQuestionSet.count) * 100))) ?? 0
    }
}


// MARK: Нажатие на ответ
extension GameViewController {

    @IBAction private func answerPressed(_ sender: UIButton) {
        if answerPressed == false {
            
            /// Как только нажали, до выполнения каких либо манипуляций с ответом и флагами
            /// записываем вопрос и ответ в историю (правильность будет определяться уже после, внутри контроллера истории).
            /// Это необходимо для того, чтобы у нас правильно отрабатывали флаги и рекорд не засчитывался многократно или некорректно
            
            if weDidTakeHelp == false {
                gameHistory.append(
                    GameHistory(
                        question: questionLabel.text ?? "",
                        correctAnswer: localQuestionSet[currentQuestionIndex].optionA,
                        userAnswer: buttons.showFinalButtonsSet()[sender.tag - 1],
                        questionId: localQuestionSet[currentQuestionIndex].questionId,
                        image: localQuestionSet[currentQuestionIndex].image,
                        helpText: localQuestionSet[currentQuestionIndex].helpText
                    )
                )
            }
            
            if sender.tag == buttons.showCorrectPosition() {
                if weDidTakeHelp == false {
                    score += 1
                }
                Shadow().addGreenShadow(button: sender)
                buttons.changeColor(sender: sender, true, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .correctAnswer)
                dontUpdateQuestionFlag = false
                answerPressed = true
            } else {
                Shadow().addRedShadow(button: sender)
                buttons.changeColor(sender: sender, false, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .error)
                answerPressed = true
                
                if shouldShowAutoHelp == 1 {
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
            if currentQuestionIndex < localQuestionSet.count
                && dontUpdateQuestionFlag == false {
                currentQuestionIndex += 1
                currentQuestionNumber += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.updateQuestion()
                }
            }
        }
    }
    
    private func showHelpAfterWrongAnswer() {
        let mainStoryboard: UIStoryboard = UIStoryboard(
            name: String(
                describing:
                    HelpViewController.self
            ),
            bundle: nil
        )
        
        let helpView  = mainStoryboard.instantiateViewController(
            withIdentifier: String(
                describing: HelpViewController.self
            )
        ) as! HelpViewController
        
        helpView.delegate = self
        helpView.questionID = localQuestionSet[currentQuestionIndex].questionId
        
        if weDidTakeHelp == false {
            helpCounter += 1
        }
        
        helpCounterLabel.text = "\(helpCounter)"
        
        weDidTakeHelp = true
        weDidGetAutoHelp = true
        
        self.present(
            helpView,
            animated: false,
            completion: nil
        )
    }
}


// MARK: Завершение игры
extension GameViewController {
    
    private func gameEnding(path: Int) {
        switch path {
        case 1: /// Доиграли до конца
            callDelegateAndSaveRecord(continueStatus: false, autoHelp: weDidGetAutoHelp)
            showAlert(title: "Ваш счет", message: "\(gameHelper.updatedAlertMessage(score: updatePercentage()))")
        case 2: /// Преждевременно закончили игру
            callDelegateAndSaveRecord(continueStatus: true, autoHelp: weDidGetAutoHelp)
        default: print("gameEnding error")
        }
    }
    
    private func callDelegateAndSaveRecord(continueStatus: Bool, autoHelp: Bool) {
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
            GameResult(
                result: score,
                totalQuestion: localQuestionSet.count,
                percentOfCorrect: updatePercentage(),
                topic: SelectedTopic.shared.topic.topicName,
                helpCounter: helpCounter,
                playedNum: currentQuestionIndex
            )
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
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "\(title): \(score)", message: "\(message)", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Перезапустить", style: .default, handler: { action in self.restartGame() })
        let quitAction = UIAlertAction(title: "Выйти", style: .default, handler: { action in self.quitGame() })
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        present(alert, animated: true, completion: nil)
        currentQuestionNumber -= 1
    }
    
    private func quitGame() {
        gameHelper.refreshRandomSet(tag: SelectedTopic.shared.topic.topicTag)
        self.dismiss(animated: true, completion: nil)
    }
    
    private func restartGame() {
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
                        question: questionLabel.text ?? "",
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
