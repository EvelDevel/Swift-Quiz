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
        whiteProgressView.layer.cornerRadius = cornerRadius
        greenProgressView.layer.cornerRadius = cornerRadius
    }
    
    private func setupAnimatedProgress(
        _ value: Double
    ) {
        if needAnimate {
            let progressWidth = value >= 2 ? value : 2
            let fullWidth = frame.width - progressBarPadding
            let actualProgressValue = CGFloat(Double(progressWidth) / 100)
            let newWidth = fullWidth * actualProgressValue
            let duration = CGFloat(actualProgressValue) + 0.4
            
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
            
            DispatchQueue.global().async {
                if value > 0 {
                    let roundedValue = Int(value.rounded())
                    
                    for num in 0 ..< (roundedValue + 1) {
                        let sleepTime = UInt32((duration - 0.4) / Double(roundedValue) * 1000000.0)
                        usleep(sleepTime)
                        
                        DispatchQueue.main.async {
                            self.percentageLabel.text = "\(num)%"
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.percentageLabel.text = "0%"
                    }
                }
            }
        }
    }
}
