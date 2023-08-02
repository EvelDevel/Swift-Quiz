
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
    
    weak var delegate: RecordsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
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
    
    func deleteRecords() {
        Game.shared.clearRecords()
        tableView.reloadData()
        playTrashSound()
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
            
			tableView.reloadData()
			
            self.playTrashSound()
			
			if indexPath.row == 0 {
				Game.shared.updateContinueStatus()
			}
		}
        
		reportAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2371389396, blue: 0.1065657165, alpha: 0.5)
        
		return UISwipeActionsConfiguration(
            actions: [reportAction]
        )
	}
}


// MARK: - Table View Handling

extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    func cellRegistration() {
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
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(
                describing: RecordCell.self
            ),
            for: indexPath
        ) as? RecordCell else {
			return UITableViewCell()
		}
        
		cell.cellIndex = indexPath.row
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
}
