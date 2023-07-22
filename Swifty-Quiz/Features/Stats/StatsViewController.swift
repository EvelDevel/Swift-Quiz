//
//  StatsViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

final class StatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private enum StatsCellType {
        case totalQuestions(String, Double)
        case correctAnswers(String, Double)
        case percentOfCorrectAnswers(String, Double)
        case incorrectAnswers(String, Double)
        case tips(String, Double)
        case playedTopics(String, Double)
    }
    
    private var statsItems: [StatsCellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        loadData()
        setupTableView()
    }
    
    private func loadData() {
        statsItems = [
            .totalQuestions(
                "Всего пройдено вопросов",
                findTotalAnsweredQuestions()
            ),
            .correctAnswers(
                "Правильных ответов",
                findTotalCorrectAnsweredQuestions()
            ),
            .percentOfCorrectAnswers(
                "Процент правильных ответов",
                50
            ),
            .incorrectAnswers(
                "Неправильных ответов",
                30
            ),
            .tips(
                "Подсказок взято",
                2
            ),
            .playedTopics(
                "Тем пройдено",
                100
            )
        ]
    }
    
    // MARK: - Privates calculate methods
    
    private func findTotalAnsweredQuestions() -> Double {
        let records = Game.shared.records
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
        let records = Game.shared.records
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
}

// MARK: - Table View Handling

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        [
            ProgressBarTableViewCell.self
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
        switch indexPath.row {
        case 0...5:
            return 70
        default:
            return 50
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = statsItems[indexPath.row]
        let type: Any.Type

        switch model {
        case .correctAnswers, .percentOfCorrectAnswers, .totalQuestions:
            type = ProgressBarTableViewCell.self
        case .incorrectAnswers, .tips, .playedTopics:
            type = ProgressBarTableViewCell.self
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(
                describing: type
            ),
            for: indexPath
        )

        switch model {
        case let .totalQuestions(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        case let .correctAnswers(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        case let .percentOfCorrectAnswers(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        case let .incorrectAnswers(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        case let .tips(title, value):
            createProgressBarCell(
                cell: cell,
                title: title,
                value: value
            )
        case let .playedTopics(title, value):
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
}
