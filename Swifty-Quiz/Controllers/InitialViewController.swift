
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

// MARK: TODO

class InitialViewController: UIViewController {
    
    /// Для настройки логотипа
    @IBOutlet weak var logoHeight: NSLayoutConstraint!
    @IBOutlet weak var logoWidth: NSLayoutConstraint!
    @IBOutlet weak var logoVerticalPosition: NSLayoutConstraint!
    @IBOutlet weak var aboutButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var aboutButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var aboutButtonVerticalPosition: NSLayoutConstraint!
    
    private let recordCaretaker = RecordsCaretaker()
    @IBOutlet weak var totalQuestionsLabel: UILabel!
    @IBOutlet weak var selectedTopic: UILabel!
    @IBOutlet weak var lastTopic: UILabel!
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBOutlet weak var continueGameButton: UIButton!
    @IBAction func startGame(_ sender: UIButton) { }
    @IBOutlet weak var contentCenter: NSLayoutConstraint!
    @IBOutlet weak var topicPicker: UIButton!
    @IBOutlet weak var logoButton: UIButton!
    
    @IBOutlet var initialWhiteViews: [UIView]!
    @IBOutlet var initialButtons: [UIButton]!
    private let shadows = ShadowsHelper()
    
    /// Звуки
    @IBAction func goToAbout(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    @IBAction func tapButtonSounds(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDefaultQuestionSet()
        showLastGameInfo()
        updateContinueButton()
        addShadows()
        topicPickerImageTuning()
        logoImageTuning()
        correctLogoPosition()
        showTotalQuestions()
    }
    
    func showTotalQuestions() {
        /// Показываем общее количество вопросов
        _ = RandomSuperSets.getQuestions(limit: 0)
        totalQuestionsLabel.text = "Вопросов в игре: \(RandomSuperSets.showTotalquestionsNumber())"
    }
}


// MARK: Наводим красоту в UI
extension InitialViewController {
    
    /// Настройка корректного отображения стрелочки в выборе тем
    /// Без этого картинка "сжимается" по бокам, становится сплющенной
    func topicPickerImageTuning() {
        topicPicker.imageView!.contentMode = .scaleAspectFit
        topicPicker.contentVerticalAlignment = .center
        topicPicker.contentHorizontalAlignment = .right
    }
    func logoImageTuning() {
        logoButton.imageView!.contentMode = .scaleAspectFit
        logoButton.contentVerticalAlignment = .top
        logoButton.contentHorizontalAlignment = .right
    }
    
    func addShadows() {
        shadows.addStaticShadows(initialWhiteViews)
        shadows.addButtonShadows(initialButtons)
    }
    
    /// Настройка адекватного расположение логотипа
    func correctLogoPosition() {
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


// MARK: Показываем или убираем кнопку "продолжить игру"
extension InitialViewController {
    
    func updateContinueButton() {
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            UIView.animate(withDuration: 0.12, animations: {
                if self.continueGameButton.isHidden == true {
                    SoundPlayer.shared.playSound(sound: .showContinueButton)
                }
                self.contentCenter.constant = (UIScreen.main.scale / 2) + 22.5
                self.continueGameButton.isHidden = false })
        } else {
            /// Дополнительная проверка по флагу для того,
            /// чтобы по завершению игры не было фонового звука скрытия кнопки (пока мы еще в игре)
            if self.continueGameButton.isHidden == false {
                SoundPlayer.shared.playSound(sound: .hideContinueButton)
            }
            self.contentCenter.constant = (UIScreen.main.scale / 2) - 10.5
            self.continueGameButton.isHidden = true
        }
    }
}


// MARK: Загрузка дефолтной категории
extension InitialViewController {
    
    func addDefaultQuestionSet() {
        if SelectedTopic.shared.topic.questionSet.isEmpty {
            /// Первый запуск: добавляем сет, обновлянем название
            let newSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.addQuestionSet(newSet, topic: "Основы", tag: 10)
            selectedTopic.text = "Основы"
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
            lastTopic.text = "Категория: \(records[0].topic ?? "")"
            totalQuestions.text = "Вопросы: \(records[0].playedNum ?? 0) из \(records[0].totalQuestion ?? 0) (подсказок: \(records[0].helpCounter ?? 0))"
            lastScore.text = "Результат: \(records[0].score ?? 0) ответов (\(roundedPercents)%)"
        }
    }
}


// MARK: Активация делегатов
extension InitialViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// Указываем себя в качестве делегата в момент перехода по нужным segue
        /// Выполняем проверку, что выбранный сет вопросов не пустой
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
        
        lastTopic.text = "Категория: \(topic)"
        totalQuestions.text = "Вопросы: \(playedNum) из \(totalQuestion) (подсказок: \(helpCounter))"
        lastScore.text = "Результат: \(result) правильных (\(percentOfCorrect)%)"
        
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
