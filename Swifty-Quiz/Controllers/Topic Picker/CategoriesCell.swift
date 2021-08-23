
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
}

class CategoriesCell: UITableViewCell {
    
    /// Коллекции кнопок, разбиты по разделам,
    /// Так не нужно переделывать один массив при каждом изменении любой кнопки
    var allButtons: [UIButton] = []
    
    @IBOutlet var superSets: [UIButton]!
    @IBOutlet var guide: [UIButton]!
    @IBOutlet var patterns: [UIButton]!
    @IBOutlet var other: [UIButton]!
    
    weak var delegate: CategoriesCellDelegate?
    
    private let shadows = Shadow()
    private var lastPosition = SelectedTopic.shared.topic.topicTag
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appendAllButtons()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
        addShadows()
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
}


// MARK: Работа с UI наших аутлетов
extension CategoriesCell {
    
    /// Объединяем аутлеты в пачку
    func appendAllButtons() {
        allButtons.append(contentsOf: superSets)
        allButtons.append(contentsOf: guide)
        allButtons.append(contentsOf: patterns)
        allButtons.append(contentsOf: other)
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
            if UIScreen.main.bounds.size.width > 320 {
                button.titleLabel?.font = .systemFont(
                    ofSize: 13,
                    weight: .light
                )
            } else {
                button.titleLabel?.font = .systemFont(
                    ofSize: 10
                )
            }
        }
    }
}


// MARK: Выбор категории
extension CategoriesCell {
    
    /// Загружаем пачку вопросов в наш синглтон массив по нажатию на тему
    func addQuestionsToArray(sender: UIButton) {
        var newQuestionSet: [Question] = []
        let currentTag = SelectedTopic.shared.topic.topicTag
        
        switch sender.tag {

        /// При добавлении новых сетов с подборками случайных вопросов
        /// Добавлять рефреш в refreshRandomSets() внутри GameViewController
        /// Это обновляет случайный сет, когда мы его доиграли (чтобы не играть его снова)
        
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
    
        case 12:
            newQuestionSet = TopicOperator.getTheBasics()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Основы", tag: 11)
        case 13:
            newQuestionSet = TopicOperator.getIntegersAndBooleans()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Числовые и логические типы", tag: 12)
            
        case 14:
            newQuestionSet = TopicOperator.getBasicOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Базовые операторы", tag: 13)
        case 15:
            newQuestionSet = TopicOperator.getRangeOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Операторы диапазона", tag: 14)
            
            
        case 16:
            newQuestionSet = TopicOperator.getBooleanOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Логические операторы", tag: 15)
        case 17:
            newQuestionSet = TopicOperator.getStringAndCharacters()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Строки и символы", tag: 16)
        
            
        case 18:
            newQuestionSet = TopicOperator.getCollections()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Коллекции, массивы", tag: 17)
        case 19:
            newQuestionSet = TopicOperator.getSets()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Множества", tag: 18)
        case 20:
            newQuestionSet = TopicOperator.getDictionaries()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Словари", tag: 19)
            
            
        case 21:
            newQuestionSet = TopicOperator.getTuples()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Кортежи", tag: 20)
        case 22:
            newQuestionSet = TopicOperator.getControlFlow()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Управление потоком", tag: 21)
        
            
        case 23:
            newQuestionSet = TopicOperator.getOptionalTypes()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Опциональные типы", tag: 22)
        case 24:
            newQuestionSet = TopicOperator.getFunctions()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Функции", tag: 23)
        case 25:
            newQuestionSet = TopicOperator.getClosures()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Замыкания", tag: 24)
            
            
        case 26:
            newQuestionSet = TopicOperator.getEnums()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Перечисления", tag: 25)
        case 27:
            newQuestionSet = TopicOperator.getStructuresAndClasses()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Структуры и классы", tag: 26)
        case 28:
            newQuestionSet = TopicOperator.getProperties()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Свойства", tag: 27)

            
        case 29:
            newQuestionSet = TopicOperator.getMethods()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Методы", tag: 28)
        case 30:
            newQuestionSet = TopicOperator.getSubscripts()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 29)
        case 31:
            newQuestionSet = TopicOperator.getInheritance()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Наследование", tag: 30)
        
            
        case 32:
            newQuestionSet = TopicOperator.getInitialization()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Инициализация", tag: 31)
        case 33:
            newQuestionSet = TopicOperator.getDeinitialization()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 32)
            
            
        case 34:
            newQuestionSet = TopicOperator.getErrorHandling()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 33)
        case 35:
            newQuestionSet = TopicOperator.getConcurrency()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Согласованность", tag: 34)
            
            
        case 36:
            newQuestionSet = TopicOperator.getOptionalChaining()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Опциональная последовательность", tag: 35)
        case 37:
            newQuestionSet = TopicOperator.getARC()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Автоматический подсчет ссылок", tag: 36)
            
            
        case 38:
            newQuestionSet = TopicOperator.getTypeCasting()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 37)
        case 39:
            newQuestionSet = TopicOperator.getNestedTypes()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 38)
            
        
        case 40:
            newQuestionSet = TopicOperator.getExtensions()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Расширения", tag: 39)
        case 41:
            newQuestionSet = TopicOperator.getOpaqueTypes()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Непрозрачные типы", tag: 40)
        
        
        case 42:
            newQuestionSet = TopicOperator.getGenerics()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 41)
        case 43:
            newQuestionSet = TopicOperator.getProtocols()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Протоколы", tag: 42)
        
            
        case 44:
            newQuestionSet = TopicOperator.getAccessControl()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 43)
        case 45:
            newQuestionSet = TopicOperator.getMemorySafety()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 44)
            
            
        case 46:
            newQuestionSet = TopicOperator.getAdvancedOperators()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 45)
             
            
        // MARK: PATTERNS
         
        case 50:
            newQuestionSet = TopicOperator.getQuestionsBasicsAboutPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Паттерны: Общие вопросы", tag: 49)
        case 51:
            newQuestionSet = TopicOperator.getQuestionsCreationalPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Порождающие паттерны", tag: 50)
        case 52:
            newQuestionSet = TopicOperator.getQuestionsStructuralPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Структурные паттерны", tag: 51)
       
        case 53:
            newQuestionSet = TopicOperator.getQuestionsBehavioralPatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Поведенческие паттерны", tag: 52)
        case 54:
            newQuestionSet = TopicOperator.getQuestionsAntipatterns()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Антипаттерны", tag: 53)
        
            
        // MARK: OTHER
        
        case 60:
            newQuestionSet = TopicOperator.getQuestionsExtremeProgramming()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Экстремальное программирование", tag: 59)
        case 61:
            newQuestionSet = TopicOperator.getQuestionsMobileSecurity()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "MASVS - Мобильная безопасность", tag: 60)
        case 62:
            newQuestionSet = TopicOperator.getQuestionsLifecycle()
            SelectedTopic.shared.saveQuestionSet(newQuestionSet, topic: "Жизненный цикл UIViewController", tag: 61)
            
        default:
            allButtons.forEach { button in
                button.backgroundColor = button.tag - 1 == currentTag ? #colorLiteral(red: 1, green: 0.8529722691, blue: 0.1131319478, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
}
