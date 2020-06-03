
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
    private let recordCaretaker = RecordsCaretaker()
    @IBOutlet weak var selectedTopic: UILabel!
    @IBOutlet weak var lastTopic: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBOutlet weak var helpCounterLabel: UILabel!
    @IBOutlet weak var playedNumberLabel: UILabel!
    @IBOutlet weak var continueGameButton: UIButton!
    @IBAction func startGame(_ sender: UIButton) { }
    @IBOutlet weak var contentCenter: NSLayoutConstraint!
    
    @IBOutlet var initialWhiteViews: [UIView]!
    @IBOutlet var initialButtons: [UIButton]!
    private let shadows = ShadowsHelper()
    
    @IBAction func tapButtonSounds(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDefaultQuestionSet()
        showLastGameInfo()
        updateContinueButton()
        addShadows()
    }
    
    func addShadows() {
        shadows.addStaticShadows(initialWhiteViews)
        shadows.addButtonShadows(initialButtons)
    }
}


// MARK: Показываем или убираем кнопку "продолжить игру"
extension InitialViewController {
    
    func updateContinueButton() {
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            UIView.animate(withDuration: 0.12, animations: {
                self.contentCenter.constant = (UIScreen.main.scale / 2) + 12.5
                self.continueGameButton.isHidden = false })
        } else {
            self.contentCenter.constant = (UIScreen.main.scale / 2) - 20.5
            continueGameButton.isHidden = true
        }
    }
}


// MARK: Загрузка дефолтной категории
extension InitialViewController {
    
    func addDefaultQuestionSet() {
        if SelectedTopic.shared.topic.questionSet.isEmpty {
            /// Первый запуск: добавляем сет, обновлянем название
            let newSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.addQuestionSet(newSet, topic: "Типы данных", tag: 0)
            selectedTopic.text = "Типы данных"
        } else {
            /// При любом повторном: берем информацию из синглтона
            selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
        }
    }
}


// MARK: Загружаем информацию о последней игре при входе
extension InitialViewController {
    
    func showLastGameInfo() {
        /// Получаем список рекордов
        let records: [Record] = recordCaretaker.getRecordsList()
        if records.count != 0 {
            /// Если он не пуст, инициализируем необходимые значения
            let roundedPercents = String(format: "%.1f", records[0].percentOfCorrectAnswer ?? 0)
            helpCounterLabel.text = "Использовано подсказок: \(records[0].helpCounter ?? 0)"
            lastTopic.text = "Категория: \(records[0].topic ?? "")"
            lastScore.text = "Правильных ответов: \(records[0].score ?? 0) (\(roundedPercents)%)"
            totalQuestions.text = "Общее количество вопросов: \(records[0].totalQuestion ?? 0)"
            playedNumberLabel.text = "Пройдено вопросов: \(records[0].playedNum ?? 0)"
        }
    }
}


// MARK: Активация делегатов
extension InitialViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// Указываем себя в качестве делегата в момент перехода по нужным segue
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


// MARK: Работа с делегатом GameViewController
extension InitialViewController: GameViewControllerDelegate {
    
    func didEndGame(result: Int,
                    totalQuestion: Int,
                    percentOfCorrect: Double,
                    topic: String,
                    helpCounter: Int,
                    playedNum: Int) {
        
        playedNumberLabel.text = "Пройдено вопросов: \(playedNum)"
        helpCounterLabel.text = "Использовано подсказок: \(helpCounter)"
        lastTopic.text = "Категория: \(topic)"
        lastScore.text = "Правильных ответов: \(result) (\(percentOfCorrect)%)"
        totalQuestions.text = "Общее количество вопросов: \(totalQuestion)"
    }
    
    func updateInitialFromGameView() {
        updateContinueButton()
    }
}


// MARK: Работа с делегатом TopicViewControllerDelegate
extension InitialViewController: TopicViewControllerDelegate {
    
    func selectedCategory() {
        selectedTopic.text = "\(SelectedTopic.shared.topic.topicName)"
    }
    func updateInitialFromTopicView() {
        updateContinueButton()
    }
}


// MARK: Работа с делегатом RecordsViewControllerDelegate
extension InitialViewController: RecordsViewControllerDelegate {
    
    func updateInitialFromRecordView() {
        updateContinueButton()
    }
}


// MARK: Работа с делегатом SettingsViewControllerDelegate
extension InitialViewController: SettingsViewControllerDelegate {
    
    func updateInitialFromSettingView() {
        updateContinueButton()
    }
}
