
//  Created by Евгений Никитин on 20.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var percentOfCorrect: UILabel!
    @IBOutlet weak var colorBackground: UIView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var totalQuestionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var helpCounterLabel: UILabel!
    @IBOutlet weak var graySeparatorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        graySeparatorHeight.constant = 1.0 / UIScreen.main.scale
    }
	
	var cellIndex: Int = 0 {
		didSet {
			let record = Game.shared.records[cellIndex]
			let dateFormatter = DateFormatter()
			dateFormatter.dateStyle = .short
			percentOfCorrect.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			
			if record.playedNum! < record.totalQuestion! {
				colorBackground.backgroundColor = #colorLiteral(red: 0.8938786387, green: 0.8978905678, blue: 0.9102204442, alpha: 1)
				percentOfCorrect.textColor = #colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1)
			} else if record.percentOfCorrectAnswer! < 30 {
				colorBackground.backgroundColor = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
			} else if record.percentOfCorrectAnswer! < 70 {
				colorBackground.backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
			} else {
				colorBackground.backgroundColor = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1)
			}
			
			if record.percentOfCorrectAnswer! < 99 {
				percentOfCorrect.text = "\(record.percentOfCorrectAnswer ?? 0)%"
			} else {
				percentOfCorrect.text = "100%"
			}
			
			helpCounterLabel.text = "Подсказки: \(record.helpCounter ?? 0)"
			topicLabel.text = "\(record.topic ?? "")"
			dateLabel.text = "Дата: \(dateFormatter.string(from: record.date ?? Date()))"
			totalQuestionLabel.text = "Вопросы: \(record.playedNum ?? 0) / \(record.totalQuestion ?? 0)"
			scoreLabel.text = "Очки: \(record.score ?? 0)"
		}
	}
}
