//
//  StatsViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

final class StatsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStatsLabel: UILabel!
    
    private var statsItems: [StatsCellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        loadData()
        setupTableView()
    }
}


// MARK: - Data Handling
extension StatsViewController {
    
    private enum StatsCellType {
        case spacer
        case infoCell(Int, Int, Int)
        case progressBarCell(String, Double)
    }
    
    private func loadData() {
        let records = RecordsCaretaker().getRecordsList()
        
        if records.count > 0 {
            tableView.isHidden = false
            emptyStatsLabel.isHidden = true
            
            let playedQuestions = findPlayedAnswersNumber()
            let allQuestions = RandomSetManager.showAllQuestionsNumber()
            let correctAnswers = findCorrectAnswersNumber()
            
            statsItems = [
                .infoCell(
                    RecordsCaretaker().getRecordsList().count,
                    getUnfinished(),
                    getScore()
                ),
                .spacer,
                .progressBarCell(
                    "Пройдено вопросов: \(playedQuestions) из \(allQuestions)",
                    findTotalAnsweredQuestions()
                ),
                .progressBarCell(
                    "Правильных ответов: \(correctAnswers) из \(playedQuestions)",
                    correctAnswersFromPlayed()
                ),
                .progressBarCell(
                    "Правильных ответов всего: \(correctAnswers) из \(allQuestions)",
                    findTotalCorrectAnsweredQuestions()
                ),
                .progressBarCell(
                    "Неправильных ответов",
                    findTotalIncorrectAnsweredQuestions()
                ),
                .progressBarCell(
                    "Подсказок взято",
                    2
                ),
                .progressBarCell(
                    "Тем пройдено",
                    100
                )
            ]
        } else {
            tableView.isHidden = true
            emptyStatsLabel.isHidden = false
        }
    }
    
    /// Private methods
    ///
    
    private func getUnfinished() -> Int {
        let records = RecordsCaretaker().getRecordsList()
        var unfinished = 0
        
        records.forEach { record in
            if record.playedNum != record.totalQuestion {
                unfinished += 1
            }
        }
        
        return unfinished
    }
    
    private func getScore() -> Int {
        let records = RecordsCaretaker().getRecordsList()
        var score = 0
        
        records.forEach { record in
            score += record.score ?? 0
        }
        
        return score
    }
    
    private func correctAnswersFromPlayed() -> Double {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                if history.userAnswer == history.correctAnswer {
                    uniqueIDsSet.insert(history.questionId)
                }
            })
        }
        
        let part = Double(uniqueIDsSet.count) / Double(findPlayedAnswersNumber())
        let percentOfCorrectAnswers = part * 100
        
        return Double(percentOfCorrectAnswers)
    }
    
    private func findPlayedAnswersNumber() -> Int {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                uniqueIDsSet.insert(history.questionId)
            })
        }
        
        return uniqueIDsSet.count
    }
    
    private func findCorrectAnswersNumber() -> Int {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                if history.userAnswer == history.correctAnswer {
                    uniqueIDsSet.insert(history.questionId)
                }
            })
        }
        
        return uniqueIDsSet.count
    }
    
    private func findTotalAnsweredQuestions() -> Double {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                uniqueIDsSet.insert(history.questionId)
            })
        }
        
        let allQuestion = RandomSetManager.showAllQuestionsNumber()
        let part = Double(uniqueIDsSet.count) / Double(allQuestion)
        let percentOfCorrectAnswers = part * 100
        
        return Double(percentOfCorrectAnswers)
    }
    
    private func findTotalCorrectAnsweredQuestions() -> Double {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                if history.userAnswer == history.correctAnswer {
                    uniqueIDsSet.insert(history.questionId)
                }
            })
        }
        
        let allQuestion = RandomSetManager.showAllQuestionsNumber()
        let part = Double(uniqueIDsSet.count) / Double(allQuestion)
        let percentOfCorrectAnswers = part * 100
        
        return Double(percentOfCorrectAnswers)
    }
    
    private func findTotalIncorrectAnsweredQuestions() -> Double {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                if history.userAnswer != history.correctAnswer {
                    uniqueIDsSet.insert(history.questionId)
                }
            })
        }
        
        let allQuestion = RandomSetManager.showAllQuestionsNumber()
        let part = Double(uniqueIDsSet.count) / Double(allQuestion)
        let percentOfIncorrectAnswers = part * 100
        
        return Double(percentOfIncorrectAnswers)
    }
}


// MARK: - Table View Handling
extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        [
            SpacerTableViewCell.self,
            ProgressBarTableViewCell.self,
            InformationTableViewCell.self
        ].forEach { [weak self] type in
            self?.tableView.register(
                UINib(
                    nibName: String(describing: type),
                    bundle: nil
                ),
                forCellReuseIdentifier: String(
                    describing: type
                )
            )
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        statsItems.count
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        let model = statsItems[indexPath.row]
        
        switch model {
        case .spacer:
            return 16
        case .infoCell:
            return 80
        case .progressBarCell:
            return 70
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = statsItems[indexPath.row]
        let type: Any.Type

        switch model {
        case .spacer:
            type = SpacerTableViewCell.self
        case .infoCell:
            type = InformationTableViewCell.self
        case .progressBarCell:
            type = ProgressBarTableViewCell.self
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(
                describing: type
            ),
            for: indexPath
        )

        switch model {
        case .spacer:
            break
        case let .infoCell(total, notOver, rating):
            createInformationCell(
                cell: cell,
                total: total,
                notOver: notOver,
                rating: rating
            )
        case let .progressBarCell(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        }

        return cell
    }
    
    private func createProgressBarCell(
        cell: UITableViewCell,
        title: String,
        value: Double
    ) {
        guard let cell = cell as? ProgressBarTableViewCell else {
            return
        }
        
        cell.fill(
            ProgressBarTableViewCell.CellModel(
                title: title,
                value: value
            )
        )
    }
    
    private func createInformationCell(
        cell: UITableViewCell,
        total: Int,
        notOver: Int,
        rating: Int
    ) {
        guard let cell = cell as? InformationTableViewCell else {
            return
        }
        
        cell.fill(
            InformationTableViewCell.CellModel(
                total: total,
                notOver: notOver,
                rating: rating
            )
        )
    }
}
