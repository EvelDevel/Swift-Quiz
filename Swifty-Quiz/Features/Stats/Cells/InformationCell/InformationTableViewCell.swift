//
//  InformationTableViewCell.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

final class InformationTableViewCell: UITableViewCell {
    @IBOutlet private weak var leftTitleLabel: UILabel!
    @IBOutlet private weak var leftValueLabel: UILabel!
    @IBOutlet private weak var rightTitleLabel: UILabel!
    @IBOutlet private weak var rightValueLabel: UILabel!
    
    private let cornerRadius: CGFloat = 8
    
    struct CellModel {
        let leftTitle: String
        let leftValue: Int
        let rightTitle: String
        let rightValue: Int
        let leftValueColor: UIColor? = nil
        let rightValueColor: UIColor? = nil
    }
    
    override func prepareForReuse() {
        rightValueLabel.textColor = UIColor(named: "TextColor")
    }
    
    func fill(_ data: CellModel) {
        leftTitleLabel.text = data.leftTitle
        rightTitleLabel.text = data.rightTitle
        leftValueLabel.text = "\(data.leftValue)"
        rightValueLabel.text = "\(data.rightValue)"
        
        if rightTitleLabel.text == Constants.scorePointsTitle {
            rightValueLabel.textColor = UIColor(named: "CustomGreen")
        }
    }
}
