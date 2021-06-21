
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

// MARK: Как добавлять категории
/// 1. Добавить необходимые кнопки раздела в xib-файле
/// 2. Создать outlet-collection с названием раздела
/// 3. Присвоить этим кнопкам свои tag (по порядку)
/// 4. Добавить элементы этой коллекции в общий массив для работы с UI (функция unificationOfOutlets)
/// 5. Добавить необходимые действия по этим кнопкам в addQuestionsToArray
/// 6. Внутри addQuestionsToArray, в кейсе default - прописать нужный кейс и диапазон
///  - отнимать tag предыдущей, последней кнопки (например, следующим будет [position-39])
/// Если происходили какие-то изменения кнопок - надо пересоздавать коллекции (чтобы сохранялся исходный порядок)

import UIKit

protocol CategoriesCellDelegate: AnyObject {
    func updateNumberOfQuestions()
    func showAlert()
	func suggestQuestion(section: String)
}

class CategoriesCell: UITableViewCell {
    
    /// Коллекции кнопок, разбиты по разделам,
    /// Так не нужно переделывать один массив при каждом изменении любой кнопки
    var allButtons: [UIButton] = []
    
    @IBOutlet var superSets: [UIButton]!
    @IBOutlet var guideQuestions: [UIButton]!
    @IBOutlet var patternsQuestions: [UIButton]!
    @IBOutlet var otherQuestions: [UIButton]!
    
	@IBOutlet weak var suggestQuestionGuide: UIButton!
	@IBOutlet weak var suggestQuestionPatterns: UIButton!
    @IBOutlet weak var suggestQuestionOthers: UIButton!
    
    weak var delegate: CategoriesCellDelegate?
    
    private let shadows = ShadowsHelper()
    private var lastPosition = SelectedTopic.shared.topic.topicTag
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appendAllButtons()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
        addShadows()
		imageTuning()
    }

    override func layoutSubviews() {
        delegate?.showAlert()
    }

    @IBAction func topicButtonPressed(_ sender: UIButton) {
        /// Срабатывание только в случае,
        /// Когда нажимаем на новую кнопку а не активную
        if sender.tag - 1 != self.lastPosition {
            updateTopicButtons()
            addQuestionsToArray(sender: sender)
            delegate?.updateNumberOfQuestions()
            Game.shared.changeContinueStatus()
            sender.backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
            lastPosition = sender.tag - 1
        }
    }
    
	/// "Предложить вопрос"
	@IBAction func suggestQuestionGuide(_ sender: Any) {
        delegate?.suggestQuestion(section: "Language Guide")
    }
	@IBAction func suggestQuestionPatterns(_ sender: Any) {
        delegate?.suggestQuestion(section: "Patterns")
    }
    @IBAction func suggestQuestionOthers(_ sender: Any) {
        delegate?.suggestQuestion(section: "Others")
    }
    

    /// Корректного отображение плюсиков
	func imageTuning() {
		imageTuning(button: suggestQuestionGuide, position: .center)
		imageTuning(button: suggestQuestionPatterns, position: .center)
        imageTuning(button: suggestQuestionOthers, position: .center)
	}
	func imageTuning(button: UIButton, position: UIControl.ContentVerticalAlignment) {
		button.imageView!.contentMode = .scaleAspectFit
		button.contentVerticalAlignment = position
		button.contentHorizontalAlignment = .right
	}
}


// MARK: Работа с UI наших аутлетов
extension CategoriesCell {
    
    /// Объединяем аутлеты в пачку
    func appendAllButtons() {
        allButtons.append(contentsOf: superSets)
        allButtons.append(contentsOf: guideQuestions)
        allButtons.append(contentsOf: patternsQuestions)
        allButtons.append(contentsOf: otherQuestions)
    }
    
    /// Добавляем тени кнопкам
    func addShadows() {
        DispatchQueue.main.async {
            self.shadows.addTopicButtonShadows(self.allButtons)
        }
    }
    
    /// Рефреш кнопок
    func updateTopicButtons() {
        allButtons.forEach() { button in
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
    /// Размер шрифта
    func setFontSize() {
        allButtons.forEach() { button in
            if UIScreen.main.bounds.size.width > 320 { button.titleLabel?.font = .systemFont(ofSize: 12)
            } else { button.titleLabel?.font = .systemFont(ofSize: 10) }
        }
    }
}


// MARK: Выбор категории
extension CategoriesCell {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        var newQuestionSet: [Question] = SelectedTopic.shared.topic.questionSet
        let position = SelectedTopic.shared.topic.topicTag
        
        switch sender.tag {
            
            // MARK: SUPER SETS
            
        // MARK: 01 row
        /// При добавлении новых сетов со подборками случайных вопросов
        /// Добавлять рефреш в refreshRandomSets() внутри GameViewController
        /// Это обновляет сет, когда мы доиграли сет, чтобы после завершения не играть его снова
        case 1:
            newQuestionSet = TopicOperator.getRandom20()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "20 случайных вопросов", tag: 0)
        case 2:
            newQuestionSet = TopicOperator.getRandom50()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "50 случайных вопросов", tag: 1)
        case 3:
            newQuestionSet = TopicOperator.getRandom100()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "100 случайных вопросов", tag: 2)
        case 4:
            newQuestionSet = TopicOperator.getGuide20()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "20 вопросов по Руководству", tag: 3)
        case 5:
            newQuestionSet = TopicOperator.getPatterns20()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "20 вопросов по Паттернам", tag: 4)
            
            
            // MARK: THE BASICS
            
        // MARK: 01 row
        case 11:
            newQuestionSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Основы", tag: 10)
        case 12:
            newQuestionSet = TopicOperator.getQuestionsBasicOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Операторы", tag: 11)
        case 13:
            newQuestionSet = TopicOperator.getQuestionsStringAndCharacters()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Строки и символы", tag: 12)
            
        // MARK: 02 row
        case 14:
            newQuestionSet = TopicOperator.getQuestionsCollectionTypes()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Типы коллекций", tag: 13)
        case 15:
            newQuestionSet = TopicOperator.getQuestionsControlFlow()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Управление потоком", tag: 14)
            
        // MARK: 03 row
        case 16:
            newQuestionSet = TopicOperator.getQuestionsFunctions()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Функции", tag: 15)
        case 17:
            newQuestionSet = TopicOperator.getQuestionsClosures()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Замыкания", tag: 16)
        case 18:
            newQuestionSet = TopicOperator.getQuestionsEnums()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Перечисления", tag: 17)
            
        // MARK: 04 row
        case 19:
            newQuestionSet = TopicOperator.getQuestionsStructuresAndClasses()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Структуры и классы", tag: 18)
        case 20:
            newQuestionSet = TopicOperator.getQuestionsProperties()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Свойства", tag: 19)
        case 21:
            newQuestionSet = TopicOperator.getQuestionsMethods()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Методы", tag: 20)
            
        // MARK: 05 row
        case 22:
            newQuestionSet = TopicOperator.getQuestionsSubscripts()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 21)
        case 23:
            newQuestionSet = TopicOperator.getQuestionsInheritance()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Наследование", tag: 22)
        case 24:
            newQuestionSet = TopicOperator.getQuestionsInitialization()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Инициализация", tag: 23)
            
        // MARK:  06 row
        case 25:
            newQuestionSet = TopicOperator.getQuestionsDeinitialization()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 24)
        case 26:
            newQuestionSet = TopicOperator.getQuestionsErrorHandling()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 25)
            
        // MARK:  07 row
        case 27:
            newQuestionSet = TopicOperator.getQuestionsOptionalChaining()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Опциональная последовательность", tag: 26)
        case 28:
            newQuestionSet = TopicOperator.getQuestionsARC()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Автоматический подсчет ссылок", tag: 27)
            
        // MARK:  08 row
        case 29:
            newQuestionSet = TopicOperator.getQuestionsTypeCasting()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 28)
        case 30:
            newQuestionSet = TopicOperator.getQuestionsNestedTypes()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 29)
            
        // MARK:  09 row
        case 31:
            newQuestionSet = TopicOperator.getQuestionsExtensions()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Расширения", tag: 30)
        case 32:
            newQuestionSet = TopicOperator.getQuestionsGenerics()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 31)
            
        // MARK:  10 row
        case 33:
            newQuestionSet = TopicOperator.getQuestionsProtocols()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Протоколы", tag: 32)
        case 34:
            newQuestionSet = TopicOperator.getQuestionsAccessControl()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 33)
            
        // MARK:  11 row
        case 35:
            newQuestionSet = TopicOperator.getQuestionsMemorySafety()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 34)
        case 36:
            newQuestionSet = TopicOperator.getQuestionsAdvancedOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 35)
             
            
            // MARK: PATTERNS
            
        // MARK: 01 row
        case 37:
            newQuestionSet = TopicOperator.getQuestionsBasicsAboutPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Паттерны: Общие вопросы", tag: 36)
        case 38:
            newQuestionSet = TopicOperator.getQuestionsCreationalPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Порождающие паттерны", tag: 37)
        case 39:
            newQuestionSet = TopicOperator.getQuestionsStructuralPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Структурные паттерны", tag: 38)
            
        // MARK: 02 row
        case 40:
            newQuestionSet = TopicOperator.getQuestionsBehavioralPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Поведенческие паттерны", tag: 39)
        case 41:
            newQuestionSet = TopicOperator.getQuestionsAntipatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Антипаттерны", tag: 40)
        
            
        // MARK: OTHER
        case 50:
            newQuestionSet = TopicOperator.getQuestionsExtremeProgramming()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Экстремальное программированиее", tag: 49)
            
        default:
            /// Последнюю выбранную категорию делаем "активной"
            switch position {
            case 0...9:
                superSets[position].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            case 10...35:
                guideQuestions[position-10].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            case 36...40:
                patternsQuestions[position-36].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            case 49...60:
                otherQuestions[position-49].backgroundColor = #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1)
            
            default:
                print("default case in addQuestionsToArray() in CategoriesCell")
            }
        }
    }
}
