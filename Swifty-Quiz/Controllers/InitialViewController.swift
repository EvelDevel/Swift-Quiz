
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import StoreKit

class InitialViewController: UIViewController {

	@IBOutlet weak var lastGameTitle: UILabel!
	@IBOutlet weak var logoHeight: NSLayoutConstraint!
	@IBOutlet weak var logoWidth: NSLayoutConstraint!
	@IBOutlet weak var logoVerticalPosition: NSLayoutConstraint!
	@IBOutlet weak var aboutButtonHeight: NSLayoutConstraint!
	@IBOutlet weak var aboutButtonWidth: NSLayoutConstraint!
	@IBOutlet weak var aboutButtonVerticalPosition: NSLayoutConstraint!
	@IBOutlet weak var contentCenter: NSLayoutConstraint!

	@IBOutlet weak var totalQuestionsLabel: UILabel!
	@IBOutlet weak var selectedTopic: UILabel!
	@IBOutlet weak var lastTopic: UILabel!
	@IBOutlet weak var lastScore: UILabel!
	@IBOutlet weak var totalQuestions: UILabel!
	@IBOutlet weak var continueGameButton: UIButton!
	@IBOutlet weak var topicPicker: UIButton!
	@IBOutlet weak var logoButton: UIButton!

	@IBOutlet var initialWhiteViews: [UIView]!
	@IBOutlet var initialButtons: [UIButton]!

	@IBAction func goToAbout(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .menuMainButton)
	}
	@IBAction func tapButtonSounds(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .menuMainButton)
	}

	private let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
	private let shadows = ShadowsHelper()
	private let recordCaretaker = RecordsCaretaker()

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpInitialInformation()
		setUpUserInterface()
	}
	
	override func viewWillLayoutSubviews() {
		updateLastGameLabel()
	}
}


// MARK: Start Information
extension InitialViewController {

	func setUpInitialInformation() {
		setStartQuestionSet()
		updateLastGameInfo()
		showTotalQuestions()
	}

	/// Загружаем дефолтный сет
	func setStartQuestionSet() {
		if SelectedTopic.shared.topic.questionSet.isEmpty || Game.shared.settings.appLastVersion != currentAppVersion {
			let newSet = TopicOperator.getTheBasics()
			SelectedTopic.shared.saveQuestionSet(newSet, topic: "Основы", tag: 11)
			selectedTopic.text = "Основы"
			Game.shared.changeContinueStatus()
		} else {
			selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
		}
	}

	/// Устанавливаем информацию о последней игре
	func updateLastGameInfo() {
		let records: [Record] = recordCaretaker.getRecordsList()
		if records.count != 0 {
			let category = records.first?.topic ?? ""
			let played = records.first?.playedNum ?? 0
			let total = records.first?.totalQuestion ?? 0
			let help = records.first?.helpCounter ?? 0
			let correct = records.first?.score ?? 0
			let roundedPercents = String(format: "%.1f", records.first?.percentOfCorrectAnswer ?? 0)
			lastTopic.text = "Категория: \(category)"
			totalQuestions.text = "Вопросы: \(played) из \(total) (подсказок: \(help))"
			lastScore.text = "Правильных ответов: \(correct) (\(roundedPercents)%)"
		} else {
			lastTopic.text = "Категория: "
			totalQuestions.text = "Вопросы: "
			lastScore.text = "Правильных ответов: "
		}
	}

	/// Показываем общее количество вопросов в игре
	func showTotalQuestions() {
		totalQuestionsLabel.text = "Вопросов в игре: \(RandomSetManager.showAllQuestionsNumber())"
	}
}


// MARK: User Interface
extension InitialViewController {

	func setUpUserInterface() {
		updateContinueButton()
		addShadows()
		imageTuning(button: topicPicker, position: .center)
		imageTuning(button: logoButton, position: .top)
		setUpCorrectLogoPosition()
	}

	/// Показываем или скрываем кнопку "продолжить"
	func updateContinueButton() {
		if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
			if self.continueGameButton.isHidden == true { SoundPlayer.shared.playSound(sound: .showContinueButton) }
			self.contentCenter.constant = (UIScreen.main.scale / 2) + 22.5
			self.continueGameButton.isHidden = false
		} else {
			if self.continueGameButton.isHidden == false { SoundPlayer.shared.playSound(sound: .hideContinueButton) }
			self.contentCenter.constant = (UIScreen.main.scale / 2) - 10.5
			self.continueGameButton.isHidden = true
		}
	}
	
	/// Показываем корректный заголовок последней игры
	func updateLastGameLabel() {
		lastGameTitle.text = "Информация о прошлой игре: "
		if Game.shared.records.count != 0 {
			if Game.shared.records.first?.continueGameStatus ?? false {
				lastGameTitle.text = "Информация о текущей игре: "
			}
		}
	}

	/// Добавляем тени на элементы
	func addShadows() {
		shadows.addStaticShadows(initialWhiteViews)
		shadows.addButtonShadows(initialButtons)
	}

	/// Корректного отображение дополнительных картинок у кнопок
	func imageTuning(button: UIButton, position: UIControl.ContentVerticalAlignment) {
		button.imageView!.contentMode = .scaleAspectFit
		button.contentVerticalAlignment = position
		button.contentHorizontalAlignment = .right
	}

	/// Настройка адекватного расположения логотипа
	/// В зависимости от размера экрана
	func setUpCorrectLogoPosition() {
		let width = UIScreen.main.bounds.size.width
		
		if width <= 320 {
			/// SE-1
			logoVerticalPosition.constant = 40
			logoWidth.constant = 180
			logoHeight.constant = 55
			aboutButtonHeight.constant = 95
			aboutButtonWidth.constant = 210
			aboutButtonVerticalPosition.constant = 20
		} else if width <= 410 {
			/// 8, SE-2
			logoVerticalPosition.constant = 55
			logoWidth.constant = 200
			logoHeight.constant = 80
			aboutButtonHeight.constant = 105
			aboutButtonWidth.constant = 240
			aboutButtonVerticalPosition.constant = 55
		} else if width > 410 && width < 500 {
			/// 8+, 11, 7+, 11 Pro Max
			logoVerticalPosition.constant = 90
			logoWidth.constant = 220
			logoHeight.constant = 100
			aboutButtonHeight.constant = 120
			aboutButtonWidth.constant = 260
			aboutButtonVerticalPosition.constant = 75
		} else {
			/// ipads
			logoVerticalPosition.constant = 100
			logoWidth.constant = 400
			logoHeight.constant = 180
			aboutButtonHeight.constant = 200
			aboutButtonWidth.constant = 440
			aboutButtonVerticalPosition.constant = 85
		}
	}
}


// MARK: Сетаем себя как делегат
extension InitialViewController {

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier  == "toGameViewController" {
			let gameView = segue.destination as! GameViewController
			gameView.delegate = self
			gameView.weContinueLastGame = false
		} else if segue.identifier == "toTopicSelection" {
			let topicView = segue.destination as! TopicViewController
			topicView.delegate = self
		} else if segue.identifier == "continueGame" {
			let gameView = segue.destination as! GameViewController
			gameView.delegate = self
			gameView.weContinueLastGame = true
		} else if segue.identifier == "toResultsViewController" {
			let recordView = segue.destination as! RecordsViewController
			recordView.delegate = self
		} else if segue.identifier == "toSettingsViewController" {
			let settingView = segue.destination as! SettingsViewController
			settingView.delegate = self
		}
	}
}


// MARK: Выполнение функций делегата
extension InitialViewController:    GameViewControllerDelegate,
									TopicViewControllerDelegate,
									RecordsViewControllerDelegate,
									SettingsViewControllerDelegate{

	func didEndGame(result: Int, totalQuestion: Int, percentOfCorrect: Double,
					topic: String, helpCounter: Int, playedNum: Int) {
		lastTopic.text = "Категория: \(topic)"
		totalQuestions.text = "Вопросы: \(playedNum) из \(totalQuestion) (подсказок: \(helpCounter))"
		lastScore.text = "Правильных ответов: \(result) (\(percentOfCorrect)%)"
	}
	
	func updateInitialView() {
		updateContinueButton()
	}
	func selectedCategory() {
		updateLastGameLabel()
		selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
	}
	func refreshLastGameInfo() {
		updateLastGameInfo()
		updateLastGameLabel()
	}
	func showReviewRequest() {
		let recordsNumber = Game.shared.records.count
		if recordsNumber == 10 || recordsNumber == 30 || recordsNumber == 50
		|| recordsNumber == 80 || recordsNumber == 100 || recordsNumber == 150 {
			let twoSecondsFromNow = DispatchTime.now() + 1.0
			DispatchQueue.main.asyncAfter(deadline: twoSecondsFromNow) {
				SKStoreReviewController.requestReview()
			}
		}
	}
}
