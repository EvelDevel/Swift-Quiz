
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import MessageUI

protocol TopicViewControllerDelegate: AnyObject {
	func categoryWasSelected()
	func updateInitialView()
}

class TopicViewController: UIViewController {
	
    @IBOutlet private weak var countValueLabel: UILabel!
    @IBOutlet private weak var countTextLabel: UILabel!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var headerHeight: NSLayoutConstraint!
	@IBOutlet private weak var titleTopMargin: NSLayoutConstraint!
	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var successValueLabel: UILabel!
    @IBOutlet private weak var successTextLabel: UILabel!
    
    weak var delegate: TopicViewControllerDelegate?
    private let progress = ProgressService()

	override func viewDidLoad() {
		super.viewDidLoad()
        setup()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		delegate?.categoryWasSelected()
        saveAppVersion()
	}

	override func viewDidDisappear(_ animated: Bool) {
		delegate?.updateInitialView()
	}
	
	/// > 13.0 iOS Navigation settings
	override func viewWillAppear(_ animated: Bool) {
		if #available(iOS 13.0, *) {
			backButton.isHidden = true
			titleTopMargin.constant = 25
			headerHeight.constant = 80
		}
	}
	/// < 13.0 iOS Navigation
	@IBAction func dismissTopicView(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
		dismiss(animated: true, completion: nil)
	}
    
    private func setup() {
        cellRegistration()
        setupGameInformationUI()
    }

	func setupGameInformationUI() {
        let tag = SelectedTopic.shared.topic.topicTag
        
		if tag < 10 {
            setRandomGameUI()
		} else {
            setCategoryGameUI()
		}
	}
    
    private func setRandomGameUI() {
        mainTitleLabel.text = SelectedTopic.shared.topic.topicName
        let total = SelectedTopic.shared.topic.questionSet.count
        
        UIView.animate(withDuration: 0.3) {
            self.successValueLabel.text = self.getRandomGamesCounter()
            self.countValueLabel.text = "\(total)"
            self.successTextLabel.text = Constants.playedCounter
            self.countTextLabel.text = Constants.totalQuestions
        }
    }
    
    private func setCategoryGameUI() {
        mainTitleLabel.text = "\(SelectedTopic.shared.topic.topicName)"
        successTextLabel.text = Constants.learnedText
        
        UIView.animate(withDuration: 0.3) {
            self.successValueLabel.text = "\(self.progress.getProgress(for: SelectedTopic.shared.topic.topicName).progressRate)%"
            self.countValueLabel.text = "\(SelectedTopic.shared.topic.questionSet.count)"
        }
    }

	func showAlertIfNeeded() {
		if Game.shared.records.count != 0
            && Game.shared.records[0].continueGameStatus == true {
			
            if Game.shared.showTopicAlertStatus() != true {
				let alert = UIAlertController(
                    title: "Незавершенная игра",
                    message: "Если вы выберете другую тему или ответите хотя бы на один вопрос новой игры, вы потеряете возможность закончить незавершенную игру",
                    preferredStyle: .alert
                )
                
				let okAction = UIAlertAction(
                    title: "Продолжить",
                    style: .default,
                    handler: nil
                )
                
				alert.addAction(okAction)
				
                present(
                    alert,
                    animated: true,
                    completion: nil
                )
			}
            
			Game.shared.setThatWeShowedAlert()
		}
	}
    
    private func saveAppVersion() {
        let currentAppVersion = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        ) as? String ?? ""
        
        Game.shared.saveAppVersion(version: currentAppVersion)
    }
    
    private func getRandomGamesCounter() -> String {
        let records = Game.shared.getRecordsList()
        var counter = 0
        
        records.forEach { record in
            if record.topic == SelectedTopic.shared.topic.topicName {
                counter += 1
            }
        }
        
        return "\(counter)"
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate
extension TopicViewController: UITableViewDataSource, UITableViewDelegate {

	func cellRegistration() {
		tableView.register(
            UINib(
                nibName: String(
                    describing: CategoriesCell.self
                ),
                bundle: nil
            ),
            forCellReuseIdentifier: String(
                describing: CategoriesCell.self
            )
        )
	}
    
	func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
		return 1
	}
    
	func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(
                describing: CategoriesCell.self
            ),
            for: indexPath
        ) as? CategoriesCell else {
                return UITableViewCell()
            }
        
		cell.delegate = self
		return cell
	}
}


// MARK: - CategoriesCellDelegate
extension TopicViewController: CategoriesCellDelegate {

	func updateSelectedTopic() {
        setupGameInformationUI()
	}
    
    func updateSuccessRate(rate: Int) {
        UIView.animate(withDuration: 0.3) {
            self.successValueLabel.alpha = 1
            self.successValueLabel.text = "\(rate)%"
        }
    }

	func showAlert() {
		self.showAlertIfNeeded()
	}
}
