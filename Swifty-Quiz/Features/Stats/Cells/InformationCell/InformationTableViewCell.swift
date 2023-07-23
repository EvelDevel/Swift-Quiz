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
    private var needAnimate = true
    
    struct CellModel {
        let leftTitle: String
        let leftValue: Int
        let rightTitle: String
        let rightValue: Int
        let leftValueColor: UIColor? = nil
        let rightValueColor: UIColor? = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForReuse() {
        needAnimate = false 
    }
    
    func fill(_ data: CellModel) {
        leftTitleLabel.text = data.leftTitle
        rightTitleLabel.text = data.rightTitle
        
        setupAnimatedProgress(
            data.leftValue,
            label: leftValueLabel
        )
        setupAnimatedProgress(
            data.rightValue,
            label: rightValueLabel
        )
        
        if rightTitleLabel.text == "Заработал очков" {
            rightValueLabel.textColor = UIColor(named: "CustomGreen")
        }
    }
    
    // MARK: - Privates
    
    private func setup() {
        //
    }
    
    private func setupAnimatedProgress(
        _ value: Int,
        label: UILabel
    ) {
        let duration: CGFloat = 1

        if needAnimate {
            DispatchQueue.global().async {
                if value != 0 {
                    for num in 0 ..< (value + 1) {
                        let sleepTime = UInt32((duration - 0.4) / Double(value) * 1000000.0)
                        usleep(sleepTime)

                        DispatchQueue.main.async {
                            label.text = "\(num)"
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        label.text = "0"
                    }
                }
            }
        }
    }
}
