
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import Firebase
import StoreKit

final class InitialViewController: UIViewController {
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var lastGameTitle: UILabel!
    @IBOutlet private weak var contentCenter: NSLayoutConstraint!
    @IBOutlet private weak var selectedTopic: UILabel!
    @IBOutlet private weak var lastTopic: UILabel!
    @IBOutlet private weak var lastScore: UILabel!
    @IBOutlet private weak var totalQuestions: UILabel!
    @IBOutlet private weak var continueGameButton: UIButton!
    @IBOutlet private weak var topicPicker: UIButton!
    @IBOutlet private weak var logoButton: UIButton!
    @IBOutlet private weak var statsButton: UIButton!
    @IBOutlet private weak var totalQuestionsLabel: UILabel!
    
    @IBOutlet private var initialWhiteViews: [UIView]!
    @IBOutlet private var initialButtons: [UIButton]!
    
    @IBAction private func buttonTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
    private let showContinueAdditions = 22.5
    private let hideContinueAdditions = 10.5
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillLayoutSubviews() {
        updateLastGameLabel()
        updateScoreLabel()
    }
    
    @IBAction private func shareButtonTapped(_ sender: Any) {
        let viewController = StatsViewController(
            nibName: String(describing: StatsViewController.self),
            bundle: nil
        )
        
        SoundPlayer.shared.playSound(sound: .buttonTapped)
        present(viewController, animated: true)
    }
}


// MARK: - Setup

extension InitialViewController {
    private func setup() {
        setupCurrentQuestionSet()
        setupLastGameInfo()
        setupTotalQuestionLabel()
        setupContinueButton()
        setupShadows()
        setupUI()
    }
    
    private func updateScoreLabel() {
        let _ = RandomSetManager.getAllQuestions()
        let records = RecordsCaretaker().getRecordsList()
        var score = 0
        
        records.forEach { record in
            score += record.score ?? 0
        }
        
        UIView.transition(
            with: scoreLabel,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                self?.scoreLabel.text = "\(score)"
            },
            completion: nil
        )
    }
    
    private func setupTotalQuestionLabel() {
        totalQuestionsLabel.text = "\(RandomSetManager.showAllQuestionsNumber())"
    }
    
    private func setupCurrentQuestionSet() {
        let currentAppVersion = Bundle.main.object(
            forInfoDictionaryKey: Constants.appVersionKey
        ) as? String ?? ""
        
        let lastVersion = Game.shared.settings.appLastVersion
        let appVersionHasChange = lastVersion != currentAppVersion
        let isFirstTime = SelectedTopic.shared.selectedCategory.questionSet.isEmpty
        let lastGameWasFinished = Game.shared.records.first?.continueGameStatus == false
        
        if isFirstTime || (appVersionHasChange && lastGameWasFinished) {
            let newSet = TheBasicsSet.getQuestions()
            
            SelectedTopic.shared.saveQuestionSet(
                newSet,
                category: CategoriesName.basic.rawValue,
                tag: 11
            )
            
            selectedTopic.text = CategoriesName.basic.rawValue
            Game.shared.updateContinueStatus()
        } else {
            selectedTopic.text = "\(SelectedTopic.shared.selectedCategory.topicName)"
        }
    }
    
    private func setupLastGameInfo() {
        let records: [Record] = RecordsCaretaker().getRecordsList()
        
        if records.count != 0 {
            let category = records.first?.topic ?? ""
            let played = records.first?.playedNum ?? 0
            let total = records.first?.totalQuestion ?? 0
            let help = records.first?.helpCounter ?? 0
            let correct = records.first?.score ?? 0
            let roundedPercents = String(format: "%.1f", records.first?.percentOfCorrectAnswer ?? 0)
            
            changeLabelWithAnimation(
                label: lastTopic,
                text: "\(Constants.category)\(category)"
            )
            
            changeLabelWithAnimation(
                label: totalQuestions,
                text: "\(Constants.questionsText)\(played) из \(total) (\(Constants.hintsText)\(help))"
            )
            
            changeLabelWithAnimation(
                label: lastScore,
                text: "\(Constants.correctAnswers)\(correct) (\(roundedPercents)%)"
            )
        } else {
            changeLabelWithAnimation(
                label: lastTopic,
                text: Constants.category
            )
            
            changeLabelWithAnimation(
                label: totalQuestions,
                text: Constants.questionsText
            )
            
            changeLabelWithAnimation(
                label: lastScore,
                text: Constants.correctAnswers
            )
        }
        
        updateScoreLabel()
    }
}


// MARK: - Interface

extension InitialViewController {
    private func setupContinueButton() {
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            contentCenter.constant = (UIScreen.main.scale / 2) + showContinueAdditions
            continueGameButton.isHidden = false
        } else {
            contentCenter.constant = (UIScreen.main.scale / 2) - hideContinueAdditions
            continueGameButton.isHidden = true
        }
        
        updateScoreLabel()
    }
    
    private func updateLastGameLabel() {
        lastGameTitle.text = Constants.lastGameInfoTitle
        
        if Game.shared.records.count != 0 {
            if Game.shared.records.first?.continueGameStatus ?? false {
                lastGameTitle.text = Constants.currentGameInfoTitle
            }
        }
        
        updateScoreLabel()
    }
    
    private func setupShadows() {
        ShadowService().addStaticShadows(initialWhiteViews)
        ShadowService().addButtonShadows(initialButtons)
    }
    
    private func setupUI() {
        imageTuning(
            button: topicPicker,
            position: .center
        )
        
        imageTuning(
            button: logoButton,
            position: .top
        )
        
        SoundPlayer.shared.playSound(
            sound: .theAppIsLoading
        )
    }
    
    private func imageTuning(
        button: UIButton,
        position: UIControl.ContentVerticalAlignment
    ) {
        button.imageView!.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = position
        button.contentHorizontalAlignment = .right
    }
    
    private func changeLabelWithAnimation(
        label: UILabel,
        text: String
    ) {
        UIView.transition(
            with: label,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: {
                label.text = text
            },
            completion: nil
        )
    }
}


// MARK: - Set delegates

extension InitialViewController {
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        switch segue.identifier {
        case Constants.newGame:
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        case Constants.continueGame:
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
            gameView.weContinueLastGame = true
        case Constants.toTopicSelection:
            let topicView = segue.destination as! TopicViewController
            topicView.delegate = self
            
            topicView.playFromTopicsTapped = { [weak self] in
                guard let self else {
                    return
                }
                
                self.performSegue(
                    withIdentifier: Constants.newGame,
                    sender: self
                )
            }
        case Constants.toResultsViewController:
            let recordView = segue.destination as! RecordsViewController
            recordView.delegate = self
        case Constants.toSettingsViewController:
            let settingView = segue.destination as! SettingsViewController
            settingView.delegate = self
        default:
            break
        }
    }
}


// MARK: - Handle delegates

extension InitialViewController:
    GameViewControllerDelegate,
    TopicViewControllerDelegate,
    RecordsViewControllerDelegate,
    SettingsViewControllerDelegate {
    
    func showHelpController() {
        let controller = InformationViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    func didEndGame(_ result: GameResult) {
        changeLabelWithAnimation(
            label: lastTopic,
            text: "\(Constants.topicTitle)\(result.topic)"
        )
        
        changeLabelWithAnimation(
            label: totalQuestions,
            text: "\(Constants.questionsTitle)\(result.playedNum) из \(result.totalQuestion) (\(Constants.hintsTitle)\(result.helpCounter))"
        )
        
        changeLabelWithAnimation(
            label: lastScore,
            text: "\(Constants.correctAnswersTitle)\(result.result) (\(result.percentOfCorrect)%)"
        )
    }
    
    func updateInitialView() {
        setupContinueButton()
    }
    
    func categoryWasSelected() {
        updateLastGameLabel()
        selectedTopic.text = "\(SelectedTopic.shared.selectedCategory.topicName)"
    }
    
    func refreshLastGameInfo() {
        setupLastGameInfo()
        updateLastGameLabel()
    }
    
    func showReviewRequest() {
        let records = Game.shared.records.count
        if records == 50 || records == 100 || records == 150 {
            
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + 1.0
            ) {
                SKStoreReviewController.requestReview()
            }
        }
    }
}
