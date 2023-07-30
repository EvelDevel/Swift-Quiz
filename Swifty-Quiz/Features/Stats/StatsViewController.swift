//
//  StatsViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

private enum StatsCellType {
    case spacer
    case infoCell(String, Int, String, Int)
    case progressBarCell(String, Double)
}

final class StatsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStatsLabel: UILabel!
    
    private lazy var records = RecordsCaretaker().getRecordsList()
    private lazy var allQuestionsCount = RandomSetManager.showAllQuestionsNumber()
    private lazy var allQuestions = RandomSetManager.getAllQuestions()
    
    private var statsItems: [[StatsCellType]] = [[]]
    private let sectionHeaderHeight: CGFloat = 32
    private let defaultHeaderHeight: CGFloat = 8
    
    // MARK: - Computed properties
    
    private var allGamesCount: Int {
        records.count
    }
    
    private var allTopicsCount: Int {
        CategoriesName.allCases.count - 4
    }
    
    private var unfinishedGamesCount: Int {
        records.reduce(0) { $0 + ($1.gameIsFinished ? 0 : 1) }
    }
    
    private var uniquePlayedQuestions: Int {
        Set(records.compactMap {
            $0.gameHistory?
            .map { $0.questionId } }
            .flatMap { $0 }
        ).count
    }
    
    private var uniquePlayedQuestionsPercentage: Double {
        let percentage = Double(uniquePlayedQuestions) / Double(allQuestionsCount) * 100
        return percentage
    }
    
    private var allGivenAnswers: Int {
        records.reduce(into: 0) { $0 += $1.playedNum ?? 1 }
    }
    
    private var correctAnswers: Int {
        records.compactMap { $0.gameHistory }
            .flatMap { $0 }
            .filter { $0.userAnswer == $0.correctAnswer }
            .count
    }
    
    private var percentOfCorrectAnswers: Double {
        Double(correctAnswers) / Double(allGivenAnswers) * 100
    }

    private var incorrectAnswersCount: Int {
        allGivenAnswers - correctAnswers
    }
    
    private var percentOfIncorrectAnswers: Double {
        Double(incorrectAnswersCount) / Double(allGivenAnswers) * 100
    }
    
    private var totalScore: Int {
        return records.reduce(0) {
            $0 + ($1.score ?? 0)
        }
    }
    
    private var finishedTopicsCount: Int {
        return Set<String>(records.compactMap { record in
            guard let topic = record.topic, !isExcludedTopic(topic) && record.gameIsFinished else {
                return nil
            }
            
            return topic
        }).count
    }
    
    private var percentOfFinishedTopics: Double {
        Double(finishedTopicsCount) / Double(allTopicsCount)  * 100
    }
    
    private var percentOfUnfinishedGames: Double {
        Double(unfinishedGamesCount) / Double(records.count) * 100
    }
    
    private var hintsTakenCount: Int {
        records.reduce(0) { $0 + ($1.helpCounter ?? 1) }
    }
    
    private var percentOfTakenHints: Double {
        Double(hintsTakenCount) / Double(allGivenAnswers) * 100
    }

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        loadData()
        setupTableView()
    }
    
    // MARK: - Data Handling
    
    private func loadData() {
        if records.count > 0 {
            tableView.isHidden = false
            emptyStatsLabel.isHidden = true
            
            statsItems = [
                [
                    .infoCell(
                        Constants.totalQuesionsTitle,
                        allQuestionsCount,
                        Constants.playedQuestionTitle,
                        uniquePlayedQuestions
                    ),
                    .infoCell(
                        Constants.correctGivenAnswersTitle,
                        correctAnswers,
                        Constants.incorrectAnswersTitle,
                        incorrectAnswersCount
                    ),
                    .infoCell(
                        Constants.givenAnswersTitle,
                        allGivenAnswers,
                        Constants.scorePointsTitle,
                        totalScore
                    )
                    
                    // TODO: Добавить количество взятых подсказок
                    
                ],
                [
                    .progressBarCell(
                        Constants.progressPercentageTitle,
                        uniquePlayedQuestionsPercentage
                    ),
                    .progressBarCell(
                        Constants.correctPercentageTitle,
                        percentOfCorrectAnswers
                    ),
                    .progressBarCell(
                        Constants.incorrectPercentageTitle,
                        percentOfIncorrectAnswers
                    ),
                    .progressBarCell(
                        Constants.tipsPercentageTitle,
                        percentOfTakenHints
                    )
                ],
                [.spacer],
                [
                    .infoCell(
                        Constants.gamesPlayedTitle,
                        allGamesCount,
                        Constants.unfinishedGamesTitle,
                        unfinishedGamesCount
                    ),
                    .infoCell(
                        Constants.allTopicsCountTitle,
                        allTopicsCount,
                        Constants.userPlayedTitle,
                        finishedTopicsCount
                    )
                ],
                [
                    .progressBarCell(
                        Constants.topicsPlayedTitle,
                        percentOfFinishedTopics
                    ),
                    .progressBarCell(
                        Constants.unfinishedPercentageTitle,
                        percentOfUnfinishedGames
                    )
                ]
            ]
        } else {
            tableView.isHidden = true
            emptyStatsLabel.isHidden = false
        }
    }
    
    private func isExcludedTopic(_ topic: String) -> Bool {
        let excluded: Set<String> = [
            CategoriesName.random20.rawValue,
            CategoriesName.random50.rawValue,
            CategoriesName.random100.rawValue,
            CategoriesName.deathMatch.rawValue
        ]
        
        return excluded.contains(topic)
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
        titleForHeaderInSection section: Int
    ) -> String? {
        switch section {
        case 0:
            return Constants.scoreSectionHeader
        case 3:
            return Constants.gameSectionHeader
        default:
            return ""
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        switch section {
        case 0, 3:
            return sectionHeaderHeight
        default:
            return defaultHeaderHeight
        }
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        statsItems.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        statsItems[section].count
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        let model = statsItems[indexPath.section][indexPath.row]
        
        switch model {
        case .spacer:
            return 16
        case .infoCell:
            return 72
        case .progressBarCell:
            return 80
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = statsItems[indexPath.section][indexPath.row]
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
        case let .infoCell(title, value, rightTitle, rightValue):
            createInformationCell(
                cell: cell,
                leftTitle: title,
                leftValue: value,
                rightTitle: rightTitle,
                rightValue: rightValue
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
        leftTitle: String,
        leftValue: Int,
        rightTitle: String,
        rightValue: Int
    ) {
        guard let cell = cell as? InformationTableViewCell else {
            return
        }
        
        cell.fill(
            InformationTableViewCell.CellModel(
                leftTitle: leftTitle,
                leftValue: leftValue,
                rightTitle: rightTitle,
                rightValue: rightValue
            )
        )
    }
}
