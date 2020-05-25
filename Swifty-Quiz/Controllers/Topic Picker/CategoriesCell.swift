
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol CategoriesCellDelegate: class {
    func updateNumberOfQuestions()
}

class CategoriesCell: UITableViewCell {

    @IBOutlet var topicButtonOutlets: [HalfRoundButton]!
    weak var delegate: CategoriesCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addQuestionsToArray(sender: UIButton())
        setFontSize()
    }
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        updateTopicButtons()
        addQuestionsToArray(sender: sender)
        delegate?.updateNumberOfQuestions()
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
        sender.setTitleColor(.white, for: .normal)
        sender.backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateTopicButtons() {
        for i in 0..<topicButtonOutlets.count {
            topicButtonOutlets[i].setTitleColor(.black, for: .normal)
            topicButtonOutlets[i].backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        }
    }
    
    func setFontSize() {
        for button in topicButtonOutlets {
            if UIScreen.main.bounds.size.width > 320 {
                button.titleLabel?.font =  .systemFont(ofSize: 12)
            } else {
                button.titleLabel?.font =  .systemFont(ofSize: 10)
            }
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
            
            
            // MARK: THE BASICS
            
        // MARK: 01 row
        case 1:
            newQuestionSet = TopicOperator.getQuestionsTheBasics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Основы", tag: 0)
        case 2:
            newQuestionSet = TopicOperator.getQuestionsBasicOperators()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Операторы", tag: 1)
        case 3:
            newQuestionSet = TopicOperator.getQuestionsStringAndCharacters()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Строки и символы", tag: 2)
            
        // MARK: 02 row
        case 4:
            newQuestionSet = TopicOperator.getQuestionsCollectionTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Типы коллекций", tag: 3)
        case 5:
            newQuestionSet = TopicOperator.getQuestionsControlFlow()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Управление потоком", tag: 4)
            
        // MARK: 03 row
        case 6:
            newQuestionSet = TopicOperator.getQuestionsFunctions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Функции", tag: 5)
        case 7:
            newQuestionSet = TopicOperator.getQuestionsClosures()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Замыкания", tag: 6)
        case 8:
            newQuestionSet = TopicOperator.getQuestionsEnums()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Перечисления", tag: 7)
            
        // MARK: 04 row
        case 9:
            newQuestionSet = TopicOperator.getQuestionsStructuresAndClasses()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Структуры и классы", tag: 8)
        case 10:
            newQuestionSet = TopicOperator.getQuestionsProperties()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Свойства", tag: 9)
        case 11:
            newQuestionSet = TopicOperator.getQuestionsMethods()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Методы", tag: 10)
            
        // MARK: 05 row
        case 12:
            newQuestionSet = TopicOperator.getQuestionsSubscripts()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Сабскрипты", tag: 11)
        case 13:
            newQuestionSet = TopicOperator.getQuestionsInheritance()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наследование", tag: 12)
        case 14:
            newQuestionSet = TopicOperator.getQuestionsInitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Инициализация", tag: 13)
            
        // MARK:  06 row
        case 15:
            newQuestionSet = TopicOperator.getQuestionsDeinitialization()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Деинициализация", tag: 14)
        case 16:
            newQuestionSet = TopicOperator.getQuestionsErrorHandling()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Обработка ошибок", tag: 15)
            
        // MARK:  07 row
        case 17:
            newQuestionSet = TopicOperator.getQuestionsOptionalChaining()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Опциональная последовательность", tag: 16)
        case 18:
            newQuestionSet = TopicOperator.getQuestionsARC()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "ARC", tag: 17)
            
        // MARK:  08 row
        case 19:
            newQuestionSet = TopicOperator.getQuestionsTypeCasting()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Приведение типов", tag: 18)
        case 20:
            newQuestionSet = TopicOperator.getQuestionsNestedTypes()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Вложенные типы", tag: 19)
        case 21:
            newQuestionSet = TopicOperator.getQuestionsExtensions()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Расширения", tag: 20)
            
        // MARK:  09 row
        case 22:
            newQuestionSet = TopicOperator.getQuestionsGenerics()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Универсальные шаблоны", tag: 21)
        case 23:
            newQuestionSet = TopicOperator.getQuestionsProtocols()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Протоколы", tag: 22)
            
        // MARK:  10 row
        case 24:
            newQuestionSet = TopicOperator.getQuestionsAccessControl()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Контроль доступа", tag: 23)
        case 25:
            newQuestionSet = TopicOperator.getQuestionsMemorySafety()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Безопасность хранения", tag: 24)
            
         // MARK:  11 row
         case 26:
             newQuestionSet = TopicOperator.getQuestionsAdvancedOperators()
             SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Продвинутые операторы", tag: 25)
             
            
            // MARK: PATTERNS
            
        // MARK: 01 row
        case 27:
            newQuestionSet = TopicOperator.getQuestionsFactoryMethod()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Фабричный метод", tag: 26)
        case 28:
            newQuestionSet = TopicOperator.getQuestionsAbstractFactory()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Абстрактная фабрика", tag: 27)
            
            
        // MARK: 02 row
        case 29:
            newQuestionSet = TopicOperator.getQuestionsBuilder()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Строитель", tag: 28)
        case 30:
            newQuestionSet = TopicOperator.getQuestionsPrototype()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Прототип", tag: 29)
        case 31:
            newQuestionSet = TopicOperator.getQuestionsSingleton()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Одиночка", tag: 30)
        
        // MARK: 03 row
        case 32:
            newQuestionSet = TopicOperator.getQuestionsAdapter()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Адаптер", tag: 31)
        case 33:
            newQuestionSet = TopicOperator.getQuestionsBridge()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Мост", tag: 32)
        case 34:
            newQuestionSet = TopicOperator.getQuestionsComposite()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Компоновщик", tag: 33)
        
        // MARK: 04 row
        case 35:
            newQuestionSet = TopicOperator.getQuestionsComposite()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Декоратор", tag: 34)
        case 36:
            newQuestionSet = TopicOperator.getQuestionsComposite()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Фасад", tag: 35)
        case 37:
            newQuestionSet = TopicOperator.getQuestionsComposite()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Легковес", tag: 36)
        
        // MARK: 05 row
        case 38:
            newQuestionSet = TopicOperator.getQuestionsProxy()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Заместитель", tag: 37)
        case 39:
            newQuestionSet = TopicOperator.getQuestionsChainOfCommand()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Цепочка обязанностей", tag: 38)
        
        // MARK: 06 row
        case 40:
            newQuestionSet = TopicOperator.getQuestionsCommand()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Команда", tag: 39)
        case 41:
            newQuestionSet = TopicOperator.getQuestionsIterator()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Итератор", tag: 40)
        case 42:
            newQuestionSet = TopicOperator.getQuestionsMediator()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Посредник", tag: 41)
        
        // MARK: 07 row
        case 43:
            newQuestionSet = TopicOperator.getQuestionsMemento()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Хранитель", tag: 42)
        case 44:
            newQuestionSet = TopicOperator.getQuestionsObserver()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Наблюдатель", tag: 43)
        
        // MARK: 08 row
        case 45:
            newQuestionSet = TopicOperator.getQuestionsState()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Состояние", tag: 44)
        case 46:
            newQuestionSet = TopicOperator.getQuestionsStrategy()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Стратегия", tag: 45)
        case 47:
            newQuestionSet = TopicOperator.getQuestionsTemplateMethod()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Шаблонный метод", tag: 46)
        
        // MARK: 09 row
        case 48:
            newQuestionSet = TopicOperator.getQuestionsVisitor()
            SelectedTopic.shared.addQuestionSet(newQuestionSet, topic: "Посетитель", tag: 47)
            
        default:
            /// Последнюю выбранную категорию делаем "активной"
            topicButtonOutlets[position].setTitleColor(.white, for: .normal)
            topicButtonOutlets[position].backgroundColor = #colorLiteral(red: 0.3582896786, green: 0.6229948593, blue: 0.9236595812, alpha: 1)
        }
    }
}
