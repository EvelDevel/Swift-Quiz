
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
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
    @IBAction func goToAbout(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    @IBAction func tapButtonSounds(_ sender: Any) { SoundPlayer.shared.playSound(sound: .menuMainButton) }
    
    private let shadows = ShadowsHelper()
    private let recordCaretaker = RecordsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInitialInformation()
        setUpUserInterface()
    }
}


// MARK: Start Information
extension InitialViewController {
    
    func setUpInitialInformation() {
        setUpStartingQuestionSet()
        showLastGameInfo()
        showTotalQuestions()
    }
    
    /// Загружаем дефолтную или выбранную ранее категорию
    func setUpStartingQuestionSet() {
        if SelectedTopic.shared.topic.questionSet.isEmpty {
            let newSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.saveQuestionSet(newSet, topic: "Основы", tag: 10)
            selectedTopic.text = "Основы"
        } else {
            selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
        }
    }
    
    /// Показываем информацию о последней игре
    func showLastGameInfo() {
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
        }
    }
    
    /// Показываем общее количество вопросов в игре
    func showTotalQuestions() {
        _ = RandomSuperSets.getQuestions(limit: 0)
        totalQuestionsLabel.text = "Вопросов в игре: \(RandomSuperSets.showTotalquestionsNumber())"
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
            UIView.animate(withDuration: 0.12, animations: {
                if self.continueGameButton.isHidden == true { SoundPlayer.shared.playSound(sound: .showContinueButton) }
                self.contentCenter.constant = (UIScreen.main.scale / 2) + 22.5
                self.continueGameButton.isHidden = false })
        } else {
            if self.continueGameButton.isHidden == false { SoundPlayer.shared.playSound(sound: .hideContinueButton) }
            self.contentCenter.constant = (UIScreen.main.scale / 2) - 10.5
            self.continueGameButton.isHidden = true
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
        if view.frame.size.width <= 320 {
            logoVerticalPosition.constant = 40
            logoWidth.constant = 150
            logoHeight.constant = 40
            aboutButtonHeight.constant = 75
            aboutButtonWidth.constant = 170
            aboutButtonVerticalPosition.constant = 25
        } else if view.frame.size.width <= 410 {
            logoVerticalPosition.constant = 60
            logoWidth.constant = 180
            logoHeight.constant = 60
            aboutButtonHeight.constant = 95
            aboutButtonWidth.constant = 220
            aboutButtonVerticalPosition.constant = 45
        } else {
            logoVerticalPosition.constant = 100
            logoWidth.constant = 200
            logoHeight.constant = 80
            aboutButtonHeight.constant = 100
            aboutButtonWidth.constant = 240
            aboutButtonVerticalPosition.constant = 85
        }
    }
}


// MARK: Активация делегатов
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


// MARK: Работа с делегатами
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
    func updateInitialView() { updateContinueButton() }
    func selectedCategory() { selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)" }
}
