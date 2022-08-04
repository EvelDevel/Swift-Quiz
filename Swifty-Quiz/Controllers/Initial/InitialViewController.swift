
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import StoreKit

class InitialViewController: UIViewController {

    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var lastGameTitle: UILabel!
	@IBOutlet private weak var contentCenter: NSLayoutConstraint!
    @IBOutlet private weak var donationButton: UIButton!
	@IBOutlet private weak var totalQuestionsLabel: UILabel!
	@IBOutlet private weak var selectedTopic: UILabel!
	@IBOutlet private weak var lastTopic: UILabel!
    @IBOutlet private weak var lastScore: UILabel!
	@IBOutlet private weak var totalQuestions: UILabel!
	@IBOutlet private weak var continueGameButton: UIButton!
	@IBOutlet private weak var topicPicker: UIButton!
	@IBOutlet private weak var logoButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    
	@IBOutlet private var initialWhiteViews: [UIView]!
	@IBOutlet private var initialButtons: [UIButton]!

	@IBAction private func goToAbout(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
	}
    
	@IBAction private func tapButtonSounds(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
	}
    
    @IBAction private func goToDonations(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
    
	private let currentAppVersion = Bundle.main.object(
        forInfoDictionaryKey: "CFBundleShortVersionString"
    ) as? String ?? ""
    
	private let shadows = Shadow()
	private let recordCaretaker = RecordsCaretaker()

	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	override func viewWillLayoutSubviews() {
		updateLastGameLabel()
        updateScoreLabel()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        share(sender: view)
    }
}


// MARK: Main
extension InitialViewController {

    private func setup() {
        setupCurrentQuestionSet()
        updateLastGameInfo()
        updateTotalQuestionLabel()
        updateContinueButton()
        addShadows()
        imageTuning(button: topicPicker, position: .center)
        imageTuning(button: logoButton, position: .top)
    }
    
    private func updateScoreLabel() {
        let records = recordCaretaker.getRecordsList()
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
    
    private func updateTotalQuestionLabel() {
        totalQuestionsLabel.text = "\(RandomSetManager.showAllQuestionsNumber())"
    }
}


// MARK: Information
extension InitialViewController {
    
    private func setupCurrentQuestionSet() {
        let lastVersion = Game.shared.settings.appLastVersion
        let appVersionHasChange = lastVersion != currentAppVersion
        let isFirstTime = SelectedTopic.shared.topic.questionSet.isEmpty
        
        if isFirstTime || appVersionHasChange {
            let newSet = TopicOperator.getTheBasics()
            
            SelectedTopic.shared.saveQuestionSet(
                newSet, topic: "Основы", tag: 11
            )
            
            selectedTopic.text = "Основы"
            Game.shared.updateContinueStatus()
        } else {
            selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
        }
    }

    private func updateLastGameInfo() {
        let records: [Record] = recordCaretaker.getRecordsList()
        
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
    
    private func share(sender: UIView) {
        let score = Int(scoreLabel.text ?? "0") ?? 0
        
        let text = """
                     Изучаю теорию Swift в этом приложении 🤙🏻
                     Уже закрепил на \(score) очков
                     
                     #SwiftyQuiz #СвифтиКвиз #iOS
                     """
        
        let image = UIImage(named: "Share")
        
        if let myWebsite = URL(
            string: "https://apps.apple.com/ru/app/%D1%81%D0%B2%D0%B8%D1%84%D1%82%D0%B8-%D0%BA%D0%B2%D0%B8%D0%B7/id1525844750"
        ) {
            
            let objectsToShare = [text, myWebsite, image ?? UIImage()] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            // Excluded Activities
            activityVC.excludedActivityTypes = [
                UIActivity.ActivityType.airDrop,
                UIActivity.ActivityType.addToReadingList
            ]
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
        }
    }
}


// MARK: Interface
extension InitialViewController {

	/// Показываем или скрываем кнопку "продолжить"
    private func updateContinueButton() {
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
			if continueGameButton.isHidden == true {
                SoundPlayer.shared.playSound(sound: .showContinueButton)
            }
			contentCenter.constant = (UIScreen.main.scale / 2) + 22.5
			continueGameButton.isHidden = false
		} else {
			if continueGameButton.isHidden == false {
                SoundPlayer.shared.playSound(sound: .hideContinueButton)
            }
			contentCenter.constant = (UIScreen.main.scale / 2) - 10.5
			continueGameButton.isHidden = true
		}
        
        updateScoreLabel()
	}
	
	/// Показываем корректный заголовок последней игры
    private func updateLastGameLabel() {
		lastGameTitle.text = "Информация о прошлой игре: "
		
        if Game.shared.records.count != 0 {
			if Game.shared.records.first?.continueGameStatus ?? false {
				lastGameTitle.text = "Информация о текущей игре: "
			}
		}
        
        updateScoreLabel()
	}

	/// Добавляем тени на элементы
    private func addShadows() {
		shadows.addStaticShadows(initialWhiteViews)
		shadows.addButtonShadows(initialButtons)
	}

	/// Корректного отображение дополнительных картинок у кнопок
    private func imageTuning(
        button: UIButton,
        position: UIControl.ContentVerticalAlignment
    ) {
		button.imageView!.contentMode = .scaleAspectFit
		button.contentVerticalAlignment = position
		button.contentHorizontalAlignment = .right
	}
    
    /// Donation button animation
    private func showAnimation() {
        let pulse = PulseAnimation(
            numberOfPulse: 15,
            radius: 23,
            postion: donationButton.center
        )
        pulse.animationDuration = 1
        pulse.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        view.layer.insertSublayer(
            pulse,
            below: donationButton.layer
        )
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


// MARK: Set delegates
extension InitialViewController {

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier  == "newGame" {
			let gameView = segue.destination as! GameViewController
			gameView.delegate = self
			gameView.weContinueLastGame = false
		} else if segue.identifier == "continueGame" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
            gameView.weContinueLastGame = true
        } else if segue.identifier == "toTopicSelection" {
			let topicView = segue.destination as! TopicViewController
			topicView.delegate = self
		} else if segue.identifier == "toResultsViewController" {
			let recordView = segue.destination as! RecordsViewController
			recordView.delegate = self
		} else if segue.identifier == "toSettingsViewController" {
			let settingView = segue.destination as! SettingsViewController
			settingView.delegate = self
		}
	}
}


// MARK: Handle delegates
extension InitialViewController: GameViewControllerDelegate,
                                 TopicViewControllerDelegate,
                                 RecordsViewControllerDelegate,
                                 SettingsViewControllerDelegate {

    func didEndGame(_ result: GameResult) {
        changeLabelWithAnimation(
            label: lastTopic,
            text: "Категория: \(result.topic)"
        )
        
        changeLabelWithAnimation(
            label: totalQuestions,
            text: "Вопросы: \(result.playedNum) из \(result.totalQuestion) (подсказок: \(result.helpCounter))"
        )
        
        changeLabelWithAnimation(
            label: lastScore,
            text: "Правильных ответов: \(result.result) (\(result.percentOfCorrect)%)"
        )
	}
	
	func updateInitialView() {
		updateContinueButton()
	}
    
	func categoryWasSelected() {
		updateLastGameLabel()
		selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
	}
    
	func refreshLastGameInfo() {
		updateLastGameInfo()
		updateLastGameLabel()
	}
    
	func showReviewRequest() {
		let recordsNumber = Game.shared.records.count
		if recordsNumber == 50
            || recordsNumber == 150
            || recordsNumber == 250
            || recordsNumber == 350 {
            
			DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
				SKStoreReviewController.requestReview()
			}
		}
	}
}
