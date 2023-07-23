//
//  InformationTableViewCell.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 23.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

final class InformationTableViewCell: UITableViewCell {
    @IBOutlet private weak var totalGamesLabel: UILabel!
    @IBOutlet private weak var unfinishedGamesLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var whiteBackgroundView: UIView!
    
    private let cornerRadius: CGFloat = 8
    
    struct CellModel {
        let total: Int
        let notOver: Int
        let rating: Int
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func fill(_ data: CellModel) {
        setupAnimatedProgress(
            data.total,
            label: totalGamesLabel
        )
        setupAnimatedProgress(
            data.notOver,
            label: unfinishedGamesLabel
        )
        setupAnimatedProgress(
            data.rating,
            label: ratingLabel
        )
    }
    
    // MARK: - Privates
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        whiteBackgroundView.layer.cornerRadius = cornerRadius
    }
    
    private func setupAnimatedProgress(
        _ value: Int,
        label: UILabel
    ) {
        let duration: CGFloat = 1
        
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
