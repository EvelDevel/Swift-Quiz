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
    
    private var statsItems: [[StatsCellType]] = [[]]
    private var correctAnswers = 0
    private let sectionHeaderHeight: CGFloat = 32
    private let defaultHeaderHeight: CGFloat = 8
    
    private lazy var records = RecordsCaretaker().getRecordsList()
    private lazy var allQuestionsCount = RandomSetManager.showAllQuestionsNumber()
    private lazy var allQuestions = RandomSetManager.getAllQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        loadData()
        setupTableView()
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


// MARK: - Data Handling
extension StatsViewController {
    
    private enum StatsCellType {
        case spacer
        case infoCell(String, Int, String, Int)
        case progressBarCell(String, Double)
    }
    
    private func loadData() {
        correctAnswers = findCorrectAnswersNumber()
        
        if records.count > 0 {
            tableView.isHidden = false
            emptyStatsLabel.isHidden = true
            
            let uniquePlayedQuestions = uniquePlayedQuestions()
            let allPlayedQuestions = allPlayedQuestions()
            
            let incorrectAnswers = uniquePlayedQuestions - correctAnswers
            
            statsItems = [
                [
                    .infoCell(
                        Constants.totalQuesionsTitle,
                        allQuestionsCount,
                        Constants.playedQuestionTitle,
                        uniquePlayedQuestions
                    ),
                    .infoCell(
                        Constants.givenAnswersTitle,
                        allPlayedQuestions,
                        Constants.correctGivenAnswersTitle,
                        correctAnswers
                    ),
                    .infoCell(
                        Constants.incorrectAnswersTitle,
                        allPlayedQuestions - correctAnswers,
                        Constants.scorePointsTitle,
                        getScore()
                    )
                ],
                [
                    .progressBarCell(
                        Constants.progressPercentageTitle,
                        Double(findTotalAnsweredQuestions())
                    ),
                    .progressBarCell(
                        Constants.correctPercentageTitle,
                        correctAnswersFromPlayed()
                    ),
                    .progressBarCell(
                        Constants.incorrectPercentageTitle,
                        findTotalIncorrectAnsweredQuestions()
                    ),
                    .progressBarCell(
                        Constants.tipsPercentageTitle,
                        hintsNumber()
                    )
                ],
                [.spacer],
                [
                    .infoCell(
                        Constants.gamesPlayedTitle,
                        getAllGames(),
                        Constants.unfinishedGamesTitle,
                        getUnfinished()
                    ),
                    .infoCell(
                        Constants.allTopicsCountTitle,
                        getAllTopics(),
                        Constants.userPlayedTitle,
                        topicsIHavePlayed()
                    )
                ],
                [
                    .progressBarCell(
                        Constants.topicsPlayedTitle,
                        getPlayedTopicsPercentage()
                    ),
                    .progressBarCell(
                        Constants.unfinishedPercentageTitle,
                        getUnfinishedGamesPercentage()
                    )
                ]
            ]
        } else {
            tableView.isHidden = true
            emptyStatsLabel.isHidden = false
        }
    }
    
    // MARK: - First Section private methods
    
    /// Сколько всего игр сыграл пользователь
    /// Не важно, завершил или нет
    private func getAllGames() -> Int {
        records.count
    }
    
    /// Количество незавершенных игр
    private func getUnfinished() -> Int {
        var unfinished = 0
        
        records.forEach { record in
            if record.playedNum != record.totalQuestion {
                unfinished += 1
            }
        }
        
        return unfinished
    }
    
    /// Сколько не уникальных вопросов ответил пользователь
    /// Общее количество ответов
    private func allPlayedQuestions() -> Int {
        var questions = 0
        
        records.forEach { record in
            questions += record.playedNum ?? 1
        }
        
        return questions
    }
    
    /// Общий счет
    private func getScore() -> Int {
        var score = 0
        
        records.forEach { record in
            score += record.score ?? 0
        }
        
        return score
    }
    
    // MARK: - Second Section private methods
    
    /// Сколько уникальных вопросов пройдено (из всех)
    private func uniquePlayedQuestions() -> Int {
        let records = RecordsCaretaker().getRecordsList()
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                uniqueIDsSet.insert(history.questionId)
            })
        }
        
        return uniqueIDsSet.count
    }
    
    private func correctAnswersFromPlayed() -> Double {
        let part = Double(findCorrectAnswersNumber()) / Double(allPlayedQuestions())
        let percentOfCorrectAnswers = part * 100
        
        return Double(percentOfCorrectAnswers)
    }
    
    private func findCorrectAnswersNumber() -> Int {
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
    
    private func findTotalAnsweredQuestions() -> Int {
        var uniqueIDsSet = Set<Int>()
        
        records.forEach { record in
            record.gameHistory?.forEach({ history in
                uniqueIDsSet.insert(history.questionId)
            })
        }
        
        let part = Double(uniqueIDsSet.count) / Double(allQuestionsCount)
        let percentOfCorrectAnswers = part * 100
        
        return Int(percentOfCorrectAnswers)
    }
    
    private func findTotalIncorrectAnsweredQuestions() -> Double {
        let allPlayed = Double(allPlayedQuestions())
        let incorrect = Double(allPlayed - Double(correctAnswers))
        let percentOfIncorrect = (incorrect / allPlayed) * 100
        
        return percentOfIncorrect
    }
    
    // MARK: - Third section
    
    private func getAllTopics() -> Int {
        CategoriesName.allCases.count - 4
    }
    
    private func topicsIHavePlayed() -> Int {
        var uniqueTopics = Set<String>()
        
        records.forEach { record in
            uniqueTopics.insert(record.topic ?? "Основы")
        }
        
        return uniqueTopics.count
    }
    
    // MARK: - Fourth section
    
    private func hintsNumber() -> Double {
        var hints: Double = 0
        
        records.forEach { record in
            hints += Double(record.helpCounter ?? 1)
        }
        
        let allPlayed = Double(allPlayedQuestions())
        let percentOfHints = (hints / allPlayed) * 100
        
        return percentOfHints
    }
    
    private func getPlayedTopicsPercentage() -> Double {
        return Double(Double(topicsIHavePlayed()) / Double(getAllTopics())  * 100)
    }
    
    private func getUnfinishedGamesPercentage() -> Double {
        return Double(Double(getUnfinished()) / Double(records.count) * 100)
    }
}
