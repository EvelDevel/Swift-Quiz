
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(_ result: GameResult)
	func showReviewRequest()
    func updateInitialView()
}

enum GameStatus: Int {
    case finished
    case notFinished
}

class GameViewController: UIViewController {
	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var headerTopMargin: NSLayoutConstraint!
	
    @IBOutlet private weak var helpButton: UIButton!
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
    
    private var localQuestionSet: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentQuestionIndex = 0
    private var score: Int = 0
    private var helpCounter = 0
    private var alreadyTappedIncorrect: [Int] = []
    private var gameHistory: [GameHistory] = []
    
    private let gameHelper = GameHelper()
    private let buttons = AnswerButtonsView()
    private let questionOrderSetting = Game.shared.settings.questionOrder
    private let shouldShowAutoHelp = Game.shared.settings.helpAfterWrong
    private let topic = SelectedTopic.shared.topic.topicName
    private let topicTag = SelectedTopic.shared.topic.topicTag
    
    private var hintWasTaken = false            // Предотвращает повторное засчитывание подсказки
    private var dontUpdateQuestionFlag = false  // Предотвращает updateQuestion, когда это не нужно
    private var endGameFlag = false             // Предотвращает повторное сохранение одного рекорда
    private var answerPressed = false           // Уже нажали один ответ (чтобы второе нажатие не срабатывало)
    private var weDidGetAutoHelp = false        // Пользователь получил автоматическую подсказку (настройки)
    
    var weContinueLastGame = false              // Продолжаем игру или играем новую
    
    weak var delegate: GameViewControllerDelegate?
    
    @IBAction private func helpSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        /// Save if didn't save before
        /// And answer at least 1 question
        if endGameFlag == false && currentQuestionIndex > 0 {
            gameEnding(status: .notFinished)
        }
        
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
		
        dismiss(
            animated: true,
            completion: nil
        )
	}
}


// MARK: Main
extension GameViewController {
    
    private func setup() {
        setupContinueValues()
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
    
    private func setupContinueValues() {
        if Game.shared.records.count != 0 {
            if weContinueLastGame {
                self.localQuestionSet = SelectedTopic.shared.topic.continueQuestionSet
                self.currentQuestionNumber = Game.shared.records[0].playedNum! + 1
                self.hintWasTaken = Game.shared.records[0].helpFlag!
                self.gameHistory = Game.shared.records[0].gameHistory!
                self.currentQuestionIndex = Game.shared.records[0].playedNum!
                self.score = Game.shared.records[0].score!
                self.helpCounter = Game.shared.records[0].helpCounter!
                if helpCounter != 0 { self.helpCounterLabel.text = "\(helpCounter)" }
            }
        }
    }
    
    private func addQuestionSet() {
        if !weContinueLastGame {
            if questionOrderSetting == 0 {
                localQuestionSet = SelectedTopic.shared.topic.questionSet
            } else {
                localQuestionSet = SelectedTopic.shared.topic.questionSet.shuffled()
            }
        }
    }
    
    private func updateQuestion() {
        if currentQuestionIndex < localQuestionSet.count {
            buttons.refreshButtonsVisibility(
                currentQuestionIndex,
                localQuestionSet.count,
                answerButtonsCollection
            )
            
            buttons.setDefaultButtonsColor(answerButtonsCollection)
            Shadow().addButtonShadows(answerButtonsCollection)
        }
        
        answerPressed = false
        dontUpdateQuestionFlag = false
        weDidGetAutoHelp = false
        hintWasTaken = false
        alreadyTappedIncorrect = []
        addQuestionContent()
        updateUIAndProgress()
    }
    
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
            gameEnding(status: .finished)
        }
    }
    
    private func updateUIAndProgress() {
        scoreLabel.text = "\(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(localQuestionSet.count)"
        let oneQuestionWidth = (view.frame.size.width - 40) / CGFloat(localQuestionSet.count)
        progressView.frame.size.width = oneQuestionWidth * CGFloat(currentQuestionIndex)
    }
    
    private func updatePercentage() -> Double {
        return Double(
            String(
                format: "%.1f",
                (Double(self.score) / Double(self.localQuestionSet.count) * 100)
            )
        ) ?? 0
    }
}


// MARK: Нажатие на ответ
extension GameViewController {

    @IBAction private func answerPressed(_ sender: UIButton) {
        if answerPressed == false {
            
            /// Save q to history
            if !hintWasTaken {
                saveToGameHistory(
                    answer: buttons.showFinalButtonsSet()[sender.tag - 1]
                )
            }
            
            if sender.tag == buttons.showCorrectPosition() {
                if !hintWasTaken {
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
            
            if currentQuestionIndex < localQuestionSet.count && dontUpdateQuestionFlag == false {
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
        
        if !hintWasTaken {
            helpCounter += 1
        }
        
        helpCounterLabel.text = "\(helpCounter)"
        
        hintWasTaken = true
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
    
    private func gameEnding(
        status: GameStatus
    ) {
        switch status {
        case .finished:
            callDelegateAndSaveRecord(
                continueStatus: false,
                autoHelp: weDidGetAutoHelp
            )
            
            showAlert(
                title: "Ваш счет",
                message: "\(gameHelper.updatedAlertMessage(score: updatePercentage()))"
            )
        case .notFinished:
            callDelegateAndSaveRecord(
                continueStatus: true,
                autoHelp: weDidGetAutoHelp
            )
        }
    }
    
    private func callDelegateAndSaveRecord(
        continueStatus: Bool,
        autoHelp: Bool
    ) {
        var continueStatus = continueStatus
        endGameFlag = true
        
        if weDidGetAutoHelp || hintWasTaken {
            if currentQuestionNumber < localQuestionSet.count {
                currentQuestionIndex = currentQuestionIndex + 1
                hintWasTaken = false
            } else {
                continueStatus = false
            }
        }

        let record = Record(
            date: Date(),
            score: score,
            topic: topic,
            totalQuestion: localQuestionSet.count,
            percentOfCorrectAnswer: updatePercentage(),
            helpCounter: helpCounter,
            playedNum: currentQuestionIndex,
            continueGameStatus: continueStatus,
            gameHistory: gameHistory,
            helpFlag: hintWasTaken
        )
        
        /// Save or replace record
        if weContinueLastGame {
            Game.shared.replaceRecord(record)
        } else {
            Game.shared.addRecord(record)
        }
        
        delegate?.didEndGame(
            GameResult(
                result: score,
                totalQuestion: localQuestionSet.count,
                percentOfCorrect: updatePercentage(),
                topic: topic,
                helpCounter: helpCounter,
                playedNum: currentQuestionIndex
            )
        )
        
        /// Detect iOS updates (-> refresh game)
        let currentAppVersion = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        ) as? String ?? ""
        
        Game.shared.saveAppVersion(
            version: currentAppVersion
        )
        
        /// Save shuffled set for "continue"
        SelectedTopic.shared.saveShuffledSet(localQuestionSet)
        
        /// Save default set for new games
        SelectedTopic.shared.saveQuestionSet(
            SelectedTopic.shared.topic.questionSet,
            topic: topic,
            tag: topicTag
        )
    }
    
    private func showAlert(
        title: String,
        message: String
    ) {
        let alert = UIAlertController(
            title: "\(title): \(score)",
            message: "\(message)",
            preferredStyle: .alert
        )
        
        let restartAction = UIAlertAction(
            title: "Перезапустить",
            style: .default,
            handler: {
                action in self.restartGame()
            }
        )
        
        let donationAction = UIAlertAction(
            title: "Поддержать проект",
            style: .destructive,
            handler: {
                action in self.showDonation()
            }
        )
        
        let quitAction = UIAlertAction(
            title: "Выйти",
            style: .default,
            handler: {
                action in self.quitGame()
            }
        )
        
        alert.addAction(restartAction)
        alert.addAction(donationAction)
        alert.addAction(quitAction)
        
        present(
            alert,
            animated: true,
            completion: nil
        )
        
        currentQuestionNumber -= 1
    }
    
    private func showDonation() {
        let mainStoryboard: UIStoryboard = UIStoryboard(
            name: String(
                describing:
                    DonationViewController.self
            ),
            bundle: nil
        )
        
        let donationView  = mainStoryboard.instantiateViewController(
            withIdentifier: String(
                describing: DonationViewController.self
            )
        ) as! DonationViewController
        
        donationView.viewWasDismissed = {
            self.view.isUserInteractionEnabled = false
            
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 0.5
            ) {
                self.dismiss(animated: true)
            }
        }
        
        self.present(
            donationView,
            animated: false,
            completion: nil
        )
    }
    
    private func quitGame() {
        gameHelper.refreshRandomSet(
            tag: topicTag
        )
        
        dismiss(
            animated: true,
            completion: nil
        )
    }
    
    private func restartGame() {
        weContinueLastGame = false
        helpCounterLabel.text = ""
        currentQuestionNumber = 1
        weDidGetAutoHelp = false
        currentQuestionIndex = 0
        hintWasTaken = false
        endGameFlag = false
        gameHistory = []
        updateQuestion()
        helpCounter = 0
        score = 0
    }
}


// MARK: Активация делегатов
extension GameViewController {
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier  == "toHelpViewController" {
            let helpView = segue.destination as! HelpViewController
            helpView.delegate = self
            helpView.questionID = localQuestionSet[currentQuestionIndex].questionId
            
            if !hintWasTaken {
                helpCounter += 1
                
                saveToGameHistory(
                    answer: Constants.tookHint
                )
            }
            
            helpCounterLabel.text = "\(helpCounter)"
            hintWasTaken = true
        }
        
        helpButton.isEnabled = false
    }
    
    private func saveToGameHistory(
        answer: String
    ) {
        gameHistory.append(
            GameHistory(
                question: questionLabel.text ?? "",
                correctAnswer: localQuestionSet[currentQuestionIndex].optionA,
                userAnswer: answer,
                questionId: localQuestionSet[currentQuestionIndex].questionId,
                image: localQuestionSet[currentQuestionIndex].image,
                helpText: localQuestionSet[currentQuestionIndex].helpText
            )
        )
    }
}


// MARK: Работа с делегатом HelpViewController
extension GameViewController: HelpViewControllerDelegate {
    
    func updateAfterHelp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            if Game.shared.settings.changeAfterHelp == 1 {
                self.helpButton.isEnabled = true
                self.currentQuestionNumber += 1
                self.currentQuestionIndex += 1
                self.weDidGetAutoHelp = false
                self.hintWasTaken = false
                self.updateQuestion()
            }
        }
    }
    
    func refreshTappedAnswerStatus() {
        helpButton.isEnabled = true
        answerPressed = false
    }
}
