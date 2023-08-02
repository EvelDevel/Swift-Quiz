
//  Created by Евгений Никитин on 29.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

final class GameHelper {
    
    /// When we picked "random" set
    /// Shuffle when: change category, finish last random set (quit game)
    /// All other cases - same random set
    func refreshRandomSet(tag: Int) {
        switch tag {
        case 0:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(20),
                category: CategoriesName.random20.rawValue,
                tag: 0
            )
        case 1:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(50),
                category: CategoriesName.random50.rawValue,
                tag: 1
            )
        case 2:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getQuestions(100),
                category: CategoriesName.random100.rawValue,
                tag: 2
            )
        case 3:
            SelectedTopic.shared.saveQuestionSet(
                RandomSetManager.getAllQuestions(),
                category: CategoriesName.deathMatch.rawValue,
                tag: 3
            )
        default:
            break
        }
    }
    
    func updatedAlertMessage(score: Double) -> String {
        var message = ""
        
        if score < 35 {
            message = Constants.scoreBelow35Message
        } else if score < 55 {
            message = Constants.scoreBelow55Message
        } else if score < 85 {
            message = Constants.scoreBelow85Message
        } else {
            message = Constants.scoreAbove85Message
        }
        
        return message
    }
    
    func showAlertIfNeeded(
        _ continueStatus: Bool,
        _ view: UIViewController
    ) {
        if Game.shared.records.count != 0
            && Game.shared.records[0].continueGameStatus == true
            && continueStatus == false
            && Game.shared.showNewGameAlertStatus() != true {
            
            DispatchQueue.main.async {
                let alert = UIAlertController(
                    title: Constants.unfinishedGameTitle,
                    message: Constants.unfinishedGameMessage,
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(
                    title: Constants.continueGameTitle,
                    style: .default,
                    handler: { action in }
                )
                
                alert.addAction(okAction)
                
                view.present(
                    alert, animated: true,
                    completion: nil
                )
            }
            
            Game.shared.setThatWeShowedAlert()
        }
    }
    
    func setQuestionImageAndTextSizes(
        _ set: [Question],
        _ index: Int,
        _ questionImageView: UIImageView,
        _ questionImageHeight: NSLayoutConstraint,
        _ view: UIView,
        _ questionLabel: UILabel,
        _ buttons: [UIButton]
    ) {
        let width = UIScreen.main.bounds.size.width
        let image = set[index].image
        if  image == "" {
            
            questionImageView.image = nil
            questionImageHeight.constant = 0
            
            if width <= 320 {
                questionLabel.font = UIFont.systemFont(ofSize: 17.0, weight: .light)
            } else if width <= 410 {
                questionLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
            } else {
                questionLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .light)
            }
            
        } else {
            questionImageView.image = UIImage(named: image)
            
            if width <= 320 {
                questionLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
                questionImageHeight.constant = 180
            } else if width <= 410 {
                questionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
                questionImageHeight.constant = 240
            } else {
                questionLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
                questionImageHeight.constant = 280
            }
        }
        
        for button in buttons {
            if width <= 320 {
                button.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
            } else if width <= 410 {
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
            } else {
                button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
            }
        }
    }
    
    func setQuestionText(
        _ set: [Question],
        _ index: Int
    ) -> String {
        if  Game.shared.settings.questionTextShuffling == 1 {
            return set[index].question.shuffled()[0]
        } else {
            return set[index].question[0]
        }
    }
}
