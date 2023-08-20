
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import MessageUI

protocol TopicViewControllerDelegate: AnyObject {
	func categoryWasSelected()
	func updateInitialView()
}

final class TopicViewController: UIViewController {
    @IBOutlet private weak var playFromTopicsButton: RoundCornerButton!
    @IBOutlet private weak var countValueLabel: UILabel!
    @IBOutlet private weak var countTextLabel: UILabel!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var headerHeight: NSLayoutConstraint!
	@IBOutlet private weak var titleTopMargin: NSLayoutConstraint!
	@IBOutlet private weak var backButton: UIButton!
	@IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var successValueLabel: UILabel!
    @IBOutlet private weak var successTextLabel: UILabel!
    
    @IBOutlet private weak var helpProjectButton: RoundCornerButton!
    
    weak var delegate: TopicViewControllerDelegate?
    private let progress = ProgressService()
    
    var playFromTopicsTapped: (() -> Void)?

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
			headerHeight.constant = 172
		}
	}
	/// < 13.0 iOS Navigation
	@IBAction func dismissTopicView(_ sender: Any) {
		SoundPlayer.shared.playSound(sound: .buttonTapped)
		dismiss(animated: true, completion: nil)
	}
    
    private func setup() {
        setupPlayButton()
        setupCells()
        setupGameInformationUI()
        setupShadow()
    }
    
    private func setupPlayButton() {
        playFromTopicsButton.backgroundColor = UIColor(named: "BackButton")
        playFromTopicsButton.setTitleColor(.lightGray, for: .normal)
        playFromTopicsButton.isEnabled = false
    }

	private func setupGameInformationUI() {
        let tag = SelectedTopic.shared.selectedCategory.topicTag
        
		if tag < 10 {
            setRandomGameUI()
		} else {
            setCategoryGameUI()
		}
	}
    
    private func setRandomGameUI() {
        let total = SelectedTopic.shared.selectedCategory.questionSet.count
        
        mainTitleLabel.animateLabelChanges(SelectedTopic.shared.selectedCategory.topicName)
        successValueLabel.animateLabelChanges(getRandomGamesCounter())
        countValueLabel.animateLabelChanges("\(total)")
        successTextLabel.animateLabelChanges(Constants.playedCounter)
        countTextLabel.animateLabelChanges(Constants.totalQuestions)
    }

    private func setCategoryGameUI() {
        mainTitleLabel.animateLabelChanges("\(SelectedTopic.shared.selectedCategory.topicName)")
        successTextLabel.animateLabelChanges(Constants.learnedText)
        successValueLabel.animateLabelChanges("\(progress.getProgress(for: SelectedTopic.shared.selectedCategory.topicName).progressRate)%")
        countValueLabel.animateLabelChanges("\(SelectedTopic.shared.selectedCategory.questionSet.count)")
    }
    
    private func setupShadow() {
        ShadowService().addTopicButtonShadows([helpProjectButton])
    }

	private func showAlertIfNeeded() {
		if Game.shared.records.count != 0
            && Game.shared.records[0].continueGameStatus == true {
			
            if !Game.shared.weShowedAlert {
				let alert = UIAlertController(
                    title: Constants.unfinishedGameTitle,
                    message: Constants.unfinishedGameMessage,
                    preferredStyle: .alert
                )
                
				let okAction = UIAlertAction(
                    title: Constants.continueGameTitle,
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
            
			Game.shared.weShowedAlert = true
		}
	}
    
    private func saveAppVersion() {
        let currentAppVersion = Bundle.main.object(
            forInfoDictionaryKey: Constants.appVersionKey
        ) as? String ?? ""
        
        Game.shared.saveAppVersion(version: currentAppVersion)
    }
    
    private func getRandomGamesCounter() -> String {
        let records = Game.shared.getRecordsList()
        var counter = 0
        
        records.forEach { record in
            if record.topic == SelectedTopic.shared.selectedCategory.topicName {
                counter += 1
            }
        }
        
        return "\(counter)"
    }
    
    @IBAction private func playButtonTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
        
        dismiss(animated: true) { [weak self] in
            guard let self else {
                return
            }
            
            playFromTopicsTapped?()
        }
    }
    
    @IBAction func helpProjectTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        let controller = InformationViewController()
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
}


// MARK: - Table View Handling

extension TopicViewController: UITableViewDataSource, UITableViewDelegate {
	private func setupCells() {
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
        UIView.animate(withDuration: 0.3) {
            self.playFromTopicsButton.backgroundColor = UIColor(named: "MainYellowOpacity")
            self.playFromTopicsButton.setTitleColor(UIColor(named: "TextColor"), for: .normal)
            self.playFromTopicsButton.isEnabled = true
        }
        
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
