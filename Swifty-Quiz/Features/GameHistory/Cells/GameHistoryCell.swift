
//  Created by Евгений Никитин on 09.08.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameHistoryCellDelegate: AnyObject {
	func showHint(index: Int)
}

final class GameHistoryCell: UITableViewCell {
	@IBOutlet private weak var showHintButton: RoundCornerButton!
    @IBOutlet private weak var questionImage: UIImageView!
    @IBOutlet private weak var colorBack: UIView!
    @IBOutlet private weak var questionNumber: UILabel!
    @IBOutlet private weak var questionText: UILabel!
    @IBOutlet private weak var userAnswer: UILabel!
    @IBOutlet private weak var correctAnswer: UILabel!
    @IBOutlet private weak var separatorHeight: NSLayoutConstraint!
    @IBOutlet private weak var imageHeight: NSLayoutConstraint!
    @IBOutlet private weak var stackTopMargin: NSLayoutConstraint!
    
    weak var delegate: GameHistoryCellDelegate?
    var history: [GameHistory] = []
    var width: CGFloat = 350
    
    var cellIndex: Int = 0 {
        didSet {
            /// Настройка изображений
            if history[cellIndex].image == "" {
                imageHeight.constant = 0
                stackTopMargin.constant = 10
            } else {
                if let image = UIImage(named: "\(history[cellIndex].image)") {
                    questionImage.image = UIImage(named: "\(history[cellIndex].image)")
                    let ratio = image.size.width / image.size.height
                    let newHeight = width / (ratio + 0.1)
                    imageHeight.constant = newHeight - 55
                    stackTopMargin.constant = 20
                }
            }
            questionNumber.text = "\(cellIndex + 1)"
            questionText.text = history[cellIndex].question
            correctAnswer.text = "Ответ: \(history[cellIndex].correctAnswer)"
            userAnswer.text = "Ваш ответ: \(history[cellIndex].userAnswer)"
            
            showHintButton.backgroundColor = #colorLiteral(red: 0.8938786387, green: 0.8978905678, blue: 0.9102204442, alpha: 0.7)
            showHintButton.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 0.8), for: .normal)
            
            /// Цвет
            if history[cellIndex].correctAnswer == history[cellIndex].userAnswer {
                colorBack.backgroundColor = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 0.85)
                questionNumber.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else if history[cellIndex].userAnswer != Constants.tookHint {
                colorBack.backgroundColor = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 0.7)
                userAnswer.text = "Ваш ответ: \(history[cellIndex].userAnswer)"
                questionNumber.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                colorBack.backgroundColor = #colorLiteral(red: 0.8938786387, green: 0.8978905678, blue: 0.9102204442, alpha: 1)
                questionNumber.textColor = #colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1)
                userAnswer.text = Constants.tookHint
            }
        }
    }

    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        super.setSelected(
            selected,
            animated: animated
        )
        
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
	
	@IBAction func showHintTapped(_ sender: Any) {
		delegate?.showHint(
            index: cellIndex
        )
		
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
	}
}
