
//  Created by Евгений Никитин on 12.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol RecordsViewControllerDelegate: class {
    func updateInitialView()
	func refreshLastGameInfo()
}

class RecordsViewController: UIViewController {
    
	@IBOutlet weak var headerHeight: NSLayoutConstraint!
	@IBOutlet weak var titleTopMargin: NSLayoutConstraint!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cleanRecords: UIButton!
    @IBAction func cleanRecords(_ sender: UIButton) { showAlert() }
    
    weak var delegate: RecordsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
	
	/// Call delegates
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
		SoundPlayer.shared.playSound(sound: .menuMainButton)
		dismiss(animated: true, completion: nil)
	}
	
    /// Звуки нажатия кнопки и стирания рекордов
    @IBAction func clearRecordSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
	
    func playTrashSound() {
        SoundPlayer.shared.playSound(sound: .clearRecordsSound)
    }
}


// MARK: Алерт на очистку рекордов и удаление по свайпу ячейки
extension RecordsViewController {
    
    /// Вызов алерта
    func showAlert() {
        if Game.shared.records.count != 0 {
            let alert = UIAlertController(title: "Вы уверены?", message: "Рекорды нельзя будет восстановить", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "Удалить", style: .default, handler: { action in self.deleteRecords() })
            let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: { action in })
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
    /// Удаление всех рекордов (очистка)
    func deleteRecords() {
        Game.shared.clearRecords()
        tableView.reloadData()
        playTrashSound()
    }
	/// Обработка свайпа ячейки влево (удаление)
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let reportAction = UIContextualAction(style: .normal, title: "Удалить") { (action, view, completion) in
			Game.shared.deleteOneRecord(index: indexPath.row)
			tableView.reloadData()
			self.playTrashSound()
			
			/// Если удалили последний рекорд - убираем продолжение (предпоследней игре)
			/// Если убрать эту часть - можно будет продолжать любую не оконченную игру из истории (если она последняя)
			/// То есть если мы удаляем все игры до этой игры - ее можно будет доиграть
			/// Если захочется сделать возможность доигрывать все игры незавершенные (после удаления предыдущей сверху) - закомментировать
			if indexPath.row == 0 {
				Game.shared.changeContinueStatus()
			}
		}
		reportAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2371389396, blue: 0.1065657165, alpha: 0.5)
		return UISwipeActionsConfiguration(actions: [reportAction])
	}
}


// MARK: Настройка таблицы и работа с ней
extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Регистрация ячейки
    func cellRegistration() {
        tableView.register(UINib(nibName: "RecordCell", bundle: nil), forCellReuseIdentifier: "RecordCell")
    }
    /// Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    /// Настройка ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordCell else {
			return UITableViewCell()
		}
		cell.cellIndex = indexPath.row
        return cell
    }
    
    /// Отработка нажатий
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gameHistory = mainStoryboard.instantiateViewController(withIdentifier: "GameHistoryViewController") as! GameHistoryViewController
        gameHistory.history = Game.shared.records[indexPath.row].gameHistory ?? []
        self.present(gameHistory, animated: true, completion: nil)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
}
