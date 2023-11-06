
//  Created by Евгений Никитин on 12.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol RecordsViewControllerDelegate: AnyObject {
    func updateInitialView()
	func refreshLastGameInfo()
}

final class RecordsViewController: UIViewController {
	@IBOutlet private weak var headerHeight: NSLayoutConstraint!
	@IBOutlet private weak var titleTopMargin: NSLayoutConstraint!
	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var cleanRecords: UIButton!
    
    @IBAction private func cleanRecords(_ sender: UIButton) {
        showAlert()
    }
    
    private var recordsByDate: [[Record]] = []
    weak var delegate: RecordsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
	
	override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateInitialView()
		delegate?.refreshLastGameInfo()
    }
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			titleTopMargin.constant = 25
			headerHeight.constant = 65
		}
	}
	/// < 13.0 iOS Navigation
    @IBAction func dismissHistory(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
		dismiss(animated: true, completion: nil)
	}
	
    @IBAction func clearRecordSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
    }
	
    func playTrashSound() {
        SoundPlayer.shared.playSound(sound: .clearRecordsSound)
    }
    
    // MARK: - Setup
    
    private func setup() {
        recordsByDate = setupSections()
        registerCells()
    }

    private func setupSections() -> [[Record]] {
        guard !Game.shared.records.isEmpty else {
            return []
        }
        
        let dictionaryByDate = Dictionary(
            grouping: Game.shared.records,
            by: {
                Calendar.current.startOfDay(
                    for: $0.date ?? Date()
                )
            }
        )
        
        return dictionaryByDate.values.sorted(
            by: {
                $0[0].date! > $1[0].date!
            }
        )
    }
    
    func registerCells() {
        tableView.register(
            UINib(
                nibName: String(
                    describing: RecordCell.self
                ),
                bundle: nil
            ),
            forCellReuseIdentifier: String(
                describing: RecordCell.self
            )
        )
    }
    
    private func deleteRecords() {
        Game.shared.clearRecords()
        tableView.reloadData()
        playTrashSound()
    }
}


// MARK: - Алерт на очистку рекордов и удаление по свайпу ячейки
extension RecordsViewController {
    func showAlert() {
        if Game.shared.records.count != 0 {
            let alert = UIAlertController(
                title: Constants.areYouSureTitle,
                message: Constants.cantRestoreRecordsMessage,
                preferredStyle: .alert
            )
            
            let deleteAction = UIAlertAction(
                title: Constants.removeRecordsTitle,
                style: .default,
                handler: {
                    action in self.deleteRecords()
                }
            )
            
            let cancelAction = UIAlertAction(
                title: Constants.cancelRemovingRecords,
                style: .default,
                handler: { _ in }
            )
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            
            present(
                alert,
                animated: true,
                completion: nil
            )
        }
    }
}


// MARK: - Table View Handling
extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        recordsByDate.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recordsByDate[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        94
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(
                describing: RecordCell.self
            ),
            for: indexPath
        ) as? RecordCell else {
            return UITableViewCell()
        }
        
        let record = recordsByDate[indexPath.section][indexPath.row]
        let color: UIColor
        
        if record.playedNum! < record.totalQuestion! {
            color = #colorLiteral(red: 0.8938786387, green: 0.8978905678, blue: 0.9102204442, alpha: 1)
        } else if record.percentOfCorrectAnswer! < 30 {
            color = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 0.7)
        } else if record.percentOfCorrectAnswer! < 70 {
            color = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        } else {
            color = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 0.85)
        }
        
        let cellModel = RecordCell.CellModel(
            percent: record.percentOfCorrectAnswer! < 99
            ? "\(record.percentOfCorrectAnswer ?? 0)%" : Constants.correctAnswersIs100,
            color: color,
            topic: record.topic ?? "",
            totalQuestions: "\(Constants.recordCellQuestionTitle)\(record.playedNum ?? 0) / \(record.totalQuestion ?? 0)",
            score: "\(Constants.recordCellScoreTitle)\(record.score ?? 0)"
        )
        
        cell.fill(cellModel)
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        DispatchQueue.main.async {
            let mainStoryboard: UIStoryboard = UIStoryboard(
                name: Constants.gameHistory,
                bundle: nil
            )
            
            let gameHistory = mainStoryboard.instantiateViewController(
                withIdentifier: Constants.gameHistoryIdentifier
            ) as! GameHistoryViewController
            
            gameHistory.history = Game.shared.records[indexPath.row].gameHistory ?? []
            SoundPlayer.shared.playSound(sound: .buttonTapped)
            
            self.present(
                gameHistory,
                animated: true,
                completion: nil
            )
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = recordsByDate[section][0].date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        
        return formatter.string(from: date ?? Date())
    }

    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let reportAction = UIContextualAction(
            style: .normal,
            title: Constants.removeRecordsTitle
        ) { [weak self] action, view, completion in
            guard let self else {
                return
            }
            
            Game.shared.deleteOneRecord(
                index: indexPath.row
            )
            
            self.playTrashSound()
            
            if indexPath.row == 0 {
                Game.shared.updateContinueStatus()
            }
            
            recordsByDate = setupSections()
            tableView.reloadData()
        }
        
        reportAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2371389396, blue: 0.1065657165, alpha: 0.5)
        
        return UISwipeActionsConfiguration(
            actions: [reportAction]
        )
    }
}
