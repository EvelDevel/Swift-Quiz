
//  Created by Евгений Никитин on 20.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

final class RecordCell: UITableViewCell {
    @IBOutlet private weak var percentOfCorrect: UILabel!
    @IBOutlet private weak var colorBackground: UIView!
    @IBOutlet private weak var topicLabel: UILabel!
    @IBOutlet private weak var totalQuestionLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var helpCounterLabel: UILabel!
    @IBOutlet private weak var graySeparatorHeight: NSLayoutConstraint!
	@IBOutlet private var infoTitles: [UILabel]!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		setInfoTitlesFontSize()
        graySeparatorHeight.constant = 1.0 / UIScreen.main.scale
    }
	
	func setInfoTitlesFontSize() {
		let bounds = UIScreen.main.bounds.size.width
		
		if bounds <= 320 {
			for title in infoTitles {
				title.font = UIFont.systemFont(ofSize: 11.0, weight: .regular)
			}
		}
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
				colorBackground.backgroundColor = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 0.7)
			} else if record.percentOfCorrectAnswer! < 70 {
				colorBackground.backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
			} else {
				colorBackground.backgroundColor = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 0.85)
			}
			
			if record.percentOfCorrectAnswer! < 99 {
				percentOfCorrect.text = "\(record.percentOfCorrectAnswer ?? 0)%"
			} else {
                percentOfCorrect.text = Constants.correctAnswersIs100
			}
			
            helpCounterLabel.text = "\(Constants.recordCellHintTitle)\(record.helpCounter ?? 0)"
			topicLabel.text = "\(record.topic ?? "")"
            dateLabel.text = "\(Constants.recordCellDateTitle)\(dateFormatter.string(from: record.date ?? Date()))"
            totalQuestionLabel.text = "\(Constants.recordCellQuestionTitle)\(record.playedNum ?? 0) / \(record.totalQuestion ?? 0)"
            scoreLabel.text = "\(Constants.recordCellScoreTitle)\(record.score ?? 0)"
		}
	}
}
