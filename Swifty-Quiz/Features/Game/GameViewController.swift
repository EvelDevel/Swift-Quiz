
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(_ result: GameResult)
    func showReviewRequest()
    func updateInitialView()
    func showHelpController()
}

final class GameViewController: UIViewController {
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var headerTopMargin: NSLayoutConstraint!
    @IBOutlet private weak var helpButton: UIButton!
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
    
    @IBOutlet private var answerButtonsCollection: [UIButton]!
    @IBOutlet private var GameComtrollerViews: [UIView]!
    
    private var questions: [Question] = []
    private var currentQuestionNumber: Int = 1
    private var currentIndex = 0
    private var score: Int = 0
    private var helpCounter = 0
    private var alreadyTappedIncorrect: [Int] = []
    private var gameHistory: [GameHistory] = []
    private let gameHelper = GameHelper()
    private let buttons = AnswerButtonsView()
    private let questionOrderSetting = Game.shared.settings.questionOrder
    private let shouldShowAutoHelp = Game.shared.settings.helpAfterWrong
    private let topic = SelectedTopic.shared.selectedCategory.topicName
    private let topicTag = SelectedTopic.shared.selectedCategory.topicTag
    
    private var doesWeGetAutoHint = false       // Пользователь получил автоматическую подсказку (настройки)
    private var doesUserTookHint = false        // Предотвращает повторное засчитывание подсказки
    private var dontUpdateQuestionFlag = false  // Предотвращает updateQuestion, когда это не нужно
    private var endGameFlag = false             // Предотвращает повторное сохранение одного рекорда
    private var answerPressed = false           // Уже нажали один ответ (чтобы второе нажатие не срабатывало)
    
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
        /// Save if it wasn't saved before
        /// And user answered at least for 1 question
        if endGameFlag == false && currentIndex > 0 {
            endGame(
                status: .notFinished
            )
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
    
    private func addShadows() {
        ShadowService().addStaticShadows(GameComtrollerViews)
        ShadowService().addButtonShadows(answerButtonsCollection)
    }
    
    private func showAlertIfNeeded() {
        gameHelper.showAlertIfNeeded(weContinueLastGame, self)
    }
}


// MARK: - Установка и обновление основных игровых параметров

extension GameViewController {
    
    private func setupContinueValues() {
        if Game.shared.records.count != 0 {
            if weContinueLastGame {
                questions = SelectedTopic.shared.selectedCategory.continueQuestionSet
                currentQuestionNumber = Game.shared.records[0].playedNum! + 1
                doesUserTookHint = Game.shared.records[0].helpFlag!
                gameHistory = Game.shared.records[0].gameHistory!
                currentIndex = Game.shared.records[0].playedNum!
                score = Game.shared.records[0].score!
                helpCounter = Game.shared.records[0].helpCounter!
                
                if helpCounter != 0 {
                    self.helpCounterLabel.text = "\(helpCounter)"
                }
            }
        }
    }
    
    private func addQuestionSet() {
        if !weContinueLastGame {
            if questionOrderSetting == 0 {
                questions = SelectedTopic.shared.selectedCategory.questionSet
            } else {
                questions = SelectedTopic.shared.selectedCategory.questionSet.shuffled()
            }
        }
    }
    
    private func updateQuestion() {
        if currentIndex < questions.count {
            buttons.refreshButtonsVisibility(
                currentIndex,
                questions.count,
                answerButtonsCollection
            )
            
            buttons.setDefaultButtonsColor(answerButtonsCollection)
            ShadowService().addButtonShadows(answerButtonsCollection)
        }
        
        answerPressed = false
        dontUpdateQuestionFlag = false
        doesWeGetAutoHint = false
        doesUserTookHint = false
        alreadyTappedIncorrect = []
        addQuestionContent()
        updateUIAndProgress()
    }
    
    private func addQuestionContent() {
        if currentIndex <= questions.count - 1 {
            buttons.makeCorrectButtonsSet(
                currentIndex,
                questions,
                optionA,
                optionB,
                optionC,
                optionD
            )
            
            gameHelper.setQuestionImageAndTextSizes(
                questions,
                currentIndex,
                questionImageView,
                questionImageHeight,
                view,
                questionLabel,
                answerButtonsCollection
            )
            
            questionLabel.text = gameHelper.setQuestionText(
                questions,
                currentIndex
            )
            
        } else if endGameFlag == false {
            endGame(status: .finished)
        }
    }
    
    private func updateUIAndProgress() {
        scoreLabel.text = "\(score) | \(updatePercentage())%"
        questionCounterLabel.text = "\(currentQuestionNumber) / \(questions.count)"
        let oneQuestionWidth = (view.frame.size.width - 40) / CGFloat(questions.count)
        progressView.frame.size.width = oneQuestionWidth * CGFloat(currentIndex)
    }
    
    private func updatePercentage() -> Double {
        return Double(
            String(
                format: "%.1f",
                (Double(self.score) / Double(self.questions.count) * 100)
            )
        ) ?? 0
    }
}


// MARK: - Нажатие на ответ

extension GameViewController {
    @IBAction private func answerPressed(_ sender: UIButton) {
        if answerPressed == false {
            
            /// Save q to history
            if !doesUserTookHint {
                saveToGameHistory(
                    answer: buttons.showFinalButtonsSet()[sender.tag - 1]
                )
            }
            
            if sender.tag == buttons.showCorrectPosition() {
                if !doesUserTookHint {
                    score += 1
                }
                
                ShadowService().addGreenShadow(to: sender)
                buttons.changeColor(sender: sender, true, optionA, optionB, optionC, optionD)
                SoundPlayer.shared.playSound(sound: .correctAnswer)
                dontUpdateQuestionFlag = false
                answerPressed = true
            } else {
                ShadowService().addRedShadow(to: sender)
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
            
            if currentIndex < questions.count && dontUpdateQuestionFlag == false {
                currentIndex += 1
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
        helpView.questionID = questions[currentIndex].id
        helpView.links = questions[currentIndex].links
        
        if !doesUserTookHint {
            helpCounter += 1
        }
        
        helpCounterLabel.text = "\(helpCounter)"
        
        doesUserTookHint = true
        doesWeGetAutoHint = true
        
        self.present(
            helpView,
            animated: false,
            completion: nil
        )
    }
}


// MARK: - Завершение игры

extension GameViewController {
    
    private func endGame(
        status: GameStatus
    ) {
        switch status {
        case .finished:
            callDelegateAndSaveRecord(
                continueStatus: false
            )
            
            showAlert(
                title: Constants.scoreTitle,
                message: "\(gameHelper.updatedAlertMessage(score: updatePercentage()))"
            )
        case .notFinished:
            callDelegateAndSaveRecord(
                continueStatus: true
            )
        }
    }
    
    private func callDelegateAndSaveRecord(
        continueStatus: Bool
    ) {
        var continueStatus = continueStatus
        endGameFlag = true
        
        if doesWeGetAutoHint || doesUserTookHint {
            if currentQuestionNumber < questions.count {
                currentIndex = currentIndex + 1
                doesUserTookHint = false
            } else {
                continueStatus = false
            }
        }
        
        let record = Record(
            date: Date(),
            score: score,
            topic: topic,
            totalQuestion: questions.count,
            percentOfCorrectAnswer: updatePercentage(),
            helpCounter: helpCounter,
            playedNum: currentIndex,
            continueGameStatus: continueStatus,
            gameHistory: gameHistory,
            helpFlag: doesUserTookHint
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
                totalQuestion: questions.count,
                percentOfCorrect: updatePercentage(),
                topic: topic,
                helpCounter: helpCounter,
                playedNum: currentIndex
            )
        )
        
        /// Detect iOS updates (-> refresh game)
        let currentAppVersion = Bundle.main.object(
            forInfoDictionaryKey: Constants.appVersionKey
        ) as? String ?? ""
        
        Game.shared.saveAppVersion(
            version: currentAppVersion
        )
        
        /// Save shuffled set for "continue"
        SelectedTopic.shared.saveShuffledSet(questions)
        
        /// Save default set for new games
        SelectedTopic.shared.saveQuestionSet(
            SelectedTopic.shared.selectedCategory.questionSet,
            category: topic,
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
            title: Constants.restartActionAlert,
            style: .default,
            handler: {
                action in self.restartGame()
            }
        )
        
        let quitAction = UIAlertAction(
            title: Constants.quitActionAlert,
            style: .default,
            handler: {
                action in self.quitGame()
            }
        )
        
        let helpAction = UIAlertAction(
            title: Constants.helpActionAlert,
            style: .destructive,
            handler: {
                action in self.showHelpScreen()
            }
        )
        
        alert.addAction(restartAction)
        alert.addAction(quitAction)
        alert.addAction(helpAction)
        
        present(
            alert,
            animated: true,
            completion: nil
        )
        
        currentQuestionNumber -= 1
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
        doesWeGetAutoHint = false
        currentIndex = 0
        doesUserTookHint = false
        endGameFlag = false
        gameHistory = []
        updateQuestion()
        helpCounter = 0
        score = 0
    }
    
    private func showHelpScreen() {
        self.dismiss(animated: true) { [weak self] in
            guard let self else {
                return
            }
            
            self.delegate?.showHelpController()
        }
    }
}


// MARK: - Активация делегатов

extension GameViewController {
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier  == Constants.toHelpViewController {
            let helpView = segue.destination as! HelpViewController
            helpView.delegate = self
            helpView.questionID = questions[currentIndex].id
            helpView.links = questions[currentIndex].links
            
            if !doesUserTookHint {
                helpCounter += 1
                
                saveToGameHistory(
                    answer: Constants.tookHint
                )
            }
            
            helpCounterLabel.text = "\(helpCounter)"
            doesUserTookHint = true
        }
        
        helpButton.isEnabled = false
    }
    
    private func saveToGameHistory(
        answer: String
    ) {
        gameHistory.append(
            GameHistory(
                question: questionLabel.text ?? "",
                correctAnswer: questions[currentIndex].optionA,
                userAnswer: answer,
                questionId: questions[currentIndex].id,
                image: questions[currentIndex].image,
                helpText: questions[currentIndex].helpText,
                links: questions[currentIndex].links
            )
        )
    }
}


// MARK: - HelpViewController delegate

extension GameViewController: HelpViewControllerDelegate {
    func updateAfterHelp() {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 0.25
        ) {
            if Game.shared.settings.changeAfterHelp == 1 {
                self.helpButton.isEnabled = true
                self.currentQuestionNumber += 1
                self.currentIndex += 1
                self.doesWeGetAutoHint = false
                self.doesUserTookHint = false
                self.updateQuestion()
            }
        }
    }
    
    func refreshTappedAnswerStatus() {
        helpButton.isEnabled = true
        answerPressed = false
    }
}
