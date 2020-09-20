
//  Created by Евгений Никитин on 09.08.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import MessageUI

class GameHistoryViewController: UIViewController {
	
	@IBOutlet weak var headerHeight: NSLayoutConstraint!
	@IBOutlet weak var titleHeight: NSLayoutConstraint!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
    
	var history: [GameHistory] = []
    var cellWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			titleHeight.constant = 25
			headerHeight.constant = 65
		}
	}
	
	/// < 13.0 iOS Navigation
	@IBAction func dismissGameHistory(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .menuMainButton)
		dismiss(animated: true, completion: nil)
	}
}


// MARK: Работа с таблицей
extension GameHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func cellRegistration() {
        tableView.register(UINib(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameHistoryCell", for: indexPath) as? GameHistoryCell else {
            return UITableViewCell()
        }
        
        /// Настройка изображений
        if history[indexPath.row].image == "" {
            cell.imageHeight.constant = 0
            cell.stackTopMargin.constant = 10
        } else {
            if let image = UIImage(named: "\(history[indexPath.row].image)") {
                cell.questionImage.image = UIImage(named: "\(history[indexPath.row].image)")
                let ratio = image.size.width / image.size.height
                let view = self.tableView
                let width = view?.frame.size.width ?? 350
                let newHeight = width / (ratio + 0.1)
                cell.imageHeight.constant = newHeight - 55
                cell.stackTopMargin.constant = 20
            }
        }
        
        cell.questionNumber.text = "\(indexPath.row + 1)"
        cell.questionText.text = history[indexPath.row].question
        cell.correctAnswer.text = "Ответ: \(history[indexPath.row].correctAnswer)"
        cell.userAnswer.text = "Ваш ответ: \(history[indexPath.row].userAnswer)"
        
        /// Цвет: Правильный или неправильный ответ
        if history[indexPath.row].correctAnswer == history[indexPath.row].userAnswer {
            cell.colorBack.backgroundColor = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1)
            cell.questionNumber.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else if history[indexPath.row].userAnswer != "Подсказка" {
            cell.colorBack.backgroundColor = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            cell.userAnswer.text = "Ваш ответ: \(history[indexPath.row].userAnswer)"
            cell.questionNumber.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            cell.colorBack.backgroundColor = #colorLiteral(red: 0.8938786387, green: 0.8978905678, blue: 0.9102204442, alpha: 1)
            cell.questionNumber.textColor = #colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1)
            cell.userAnswer.text = "Ваш ответ: Взяли подсказку"
        }
        
        return cell
    }
    
    /// Обработка свайпа ячейки влево (для репорта)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let reportAction = UIContextualAction(style: .normal, title: "Сообщить о проблеме") { (action, view, completion) in
            self.reportButtonPressed(id: self.history[indexPath.row].questionId)
            completion(true)
        }
        reportAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return UISwipeActionsConfiguration(actions: [reportAction])
    }
}


// MARK: Работа с делегатом
extension GameHistoryViewController: MFMailComposeViewControllerDelegate {
    
    func reportButtonPressed(id: Int) {
        showMailComposer(id: id)
        SoundPlayer.shared.playSound(sound: .menuMainButton)
    }
    
    func showMailComposer(id: Int) {
        /// Проверяем, может ли девайс пользователя отправлять мэйлы
        guard MFMailComposeViewController.canSendMail() else {
            let alert = UIAlertController(  title: "Вы хотели сообщить о проблеме с вопросом",
                                            message: "К сожалению ваше устройство не может отправлять почту. Скорее всего, у вас нет ни одной активной учетной записи в приложении \"почта\".",
                                            preferredStyle: .alert)
            let ok = UIAlertAction(         title: "Понятно",
                                            style: .default,
                                            handler: { action in })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["hello@swifty-quiz.online"])
        composer.setSubject("Вопрос №\(id)")
        composer.setMessageBody("Обнаружил(а) ошибку с вопросом №\(id), она заключается в следующем: ", isHTML: false)
        present(composer, animated: true)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            let alert = UIAlertController(  title: "Возникла ошибка при отправке письма",
                                            message: "",
                                            preferredStyle: .alert)
            let ok = UIAlertAction(         title: "Понятно",
                                            style: .default,
                                            handler: { action in })
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("E-mail sent")
        @unknown default:
            print("we have some poroblems with e-mail sending")
        }
        
        controller.dismiss(animated: true)
    }
}
