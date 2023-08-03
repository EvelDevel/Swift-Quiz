//
//  ProgressBarTableViewCell.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

final class ProgressBarTableViewCell: UITableViewCell {
    struct CellModel {
        let title: String
        let value: Double
    }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var percentageLabel: UILabel!
    @IBOutlet private weak var whiteProgressView: UIView!
    @IBOutlet private weak var greenProgressView: UIView!
    @IBOutlet private weak var clearRoundedView: UIView!
    
    private let progressBarPadding: CGFloat = 92
    private let cornerRadius: CGFloat = 4
    private var needAnimate = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func fill(_ data: CellModel) {
        titleLabel.text = data.title
        setupAnimatedProgress(data.value)
    }
    
    override func prepareForReuse() {
        needAnimate = false
    }
    
    // MARK: - Privates
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        clearRoundedView.layer.cornerRadius = cornerRadius
    }
    
    private func setupAnimatedProgress(
        _ value: Double
    ) {
        if value <= 0.5 {
            greenProgressView.frame.size.width = 0
            percentageLabel.text = "0%"
            
            return
        } else {
            let progressWidth = value >= 1 ? value : 1
            let fullWidth = frame.width - progressBarPadding
            let actualProgressValue = CGFloat(Double(progressWidth) / 100)
            let newWidth = fullWidth * actualProgressValue
            let duration = CGFloat(actualProgressValue) + 0.4
            
            percentageLabel.text = "\(Int(value))%"
            
            if needAnimate {
                DispatchQueue.main.async {
                    UIView.animate(
                        withDuration: duration,
                        delay: 0.0,
                        options: .curveEaseInOut,
                        animations: {
                            self.greenProgressView.frame.size.width = newWidth
                        },
                        completion: nil
                    )
                }
            } else {
                greenProgressView.frame.size.width = newWidth
            }
        }
    }
}
