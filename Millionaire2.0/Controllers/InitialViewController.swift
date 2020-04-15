
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

// MARK: TODO Сделать чтобы по дефолту всегда выделялась и выбиралась первая категория

class InitialViewController: UIViewController {
    
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBAction func startGame(_ sender: UIButton) { }
    @IBAction func topicButtonPressed(_ sender: UIButton) { addQuestionsToArray(sender: sender) }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "toGameViewController" {
            let gameView = segue.destination as! GameViewController
            gameView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addQuestionsToArray(sender: UIButton())
    }
}


// MARK: Работа с делегатом
extension InitialViewController: GameViewControllerDelegate {
    func didEndGame(_ result: Int, _ totalQuestion: Int) {
        lastScore.text = "Ваш последний счет: \(result)"
        totalQuestions.text = "Всего вопросов: \(totalQuestion)"
    }
}


// MARK: Обработка выбора категории вопросов
extension InitialViewController {
    
    func addQuestionsToArray(sender: UIButton) {
        switch sender.tag {
        case 1:
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 2:
            let newQuestionSet = QuestionDatabase.getQuestionsOperators()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 3:
            let newQuestionSet = QuestionDatabase.getQuestionsStrings()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 4:
            let newQuestionSet = QuestionDatabase.getQuestionsCollections()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
            ///
            
        case 5:
            let newQuestionSet = QuestionDatabase.getQuestionsQueues()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 6:
            let newQuestionSet = QuestionDatabase.getQuestionsFunctions()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 7:
            let newQuestionSet = QuestionDatabase.getQuestionsClosures()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 8:
            let newQuestionSet = QuestionDatabase.getQuestionsEnums()
            PickedTopic.shared.addQuestionSet(newQuestionSet)

            ///
            
        case 9:
            let newQuestionSet = QuestionDatabase.getQuestionsStructures()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 10:
            let newQuestionSet = QuestionDatabase.getQuestionsClasses()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 11:
            let newQuestionSet = QuestionDatabase.getQuestionsProperties()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 12:
            let newQuestionSet = QuestionDatabase.getQuestionsMethods()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
            ///
            
        case 13:
            let newQuestionSet = QuestionDatabase.getQuestionsSubscripts()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 14:
            let newQuestionSet = QuestionDatabase.getQuestionsInheritance()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 15:
            let newQuestionSet = QuestionDatabase.getQuestionsInitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
            ///
            
        case 16:
            let newQuestionSet = QuestionDatabase.getQuestionsDeinitialization()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 17:
            let newQuestionSet = QuestionDatabase.getQuestionsErrorProcessing()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
            ///
            
        case 18:
            let newQuestionSet = QuestionDatabase.getQuestionsOptionals()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 19:
            let newQuestionSet = QuestionDatabase.getQuestionsTypeCasting()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 20:
            let newQuestionSet = QuestionDatabase.getQuestionsExtensions()
            PickedTopic.shared.addQuestionSet(newQuestionSet)

            ///

        case 21:
            let newQuestionSet = QuestionDatabase.getQuestionsNestedTypes()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 22:
            let newQuestionSet = QuestionDatabase.getQuestionsProtocols()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 23:
            let newQuestionSet = QuestionDatabase.getQuestionsGenerics()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
            ///
            
        case 24:
            let newQuestionSet = QuestionDatabase.getQuestionsPatterns()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 25:
            let newQuestionSet = QuestionDatabase.getQuestionsAlgorithms()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        case 26:
            let newQuestionSet = QuestionDatabase.getQuestionsARC()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
            
        default:
            let newQuestionSet = QuestionDatabase.getQuestionsTypesOfData()
            PickedTopic.shared.addQuestionSet(newQuestionSet)
        }
    }
}



