
//  Created by Евгений Никитин on 09.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class HistoryHintController: UIViewController {

	@IBOutlet weak var hintTextLabel: UILabel!
	@IBOutlet weak var hintBG: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var separatorHeight: NSLayoutConstraint!
	
	var helpText: String = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()
		changeHintText(text: helpText)
		dismissOnClick()
		addShadows()
		makeThinSeparator()
		setFontSize()
    }
	
	func changeHintText(text: String) {
		hintTextLabel.text = text
	}
}


// MARK: Dismissing
extension HistoryHintController {
	
	/// Сворачиваем подсказку по клику на пустое место контроллера
	func dismissOnClick() {
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
		gestureRecognizer.cancelsTouchesInView = false
		gestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
		view.addGestureRecognizer(gestureRecognizer)
	}
	@objc func close() {
		dismissing()
	}
	func dismissing() {
		dismiss(animated: true)
	}
	
	@IBAction func backToHistoryTapped(_ sender: Any) {
		dismiss(animated: true, completion: nil)
		SoundPlayer.shared.playSound(sound: .menuMainButton)
	}
}


// MARK: User Interface
extension HistoryHintController {
	
	func makeThinSeparator() {
		separatorHeight.constant = 1.0 / UIScreen.main.scale
	}
	func setFontSize() {
		let width = view.frame.size.width
		hintTextLabel.font = width <= 320 ? UIFont.systemFont(ofSize: 12.0) : UIFont.systemFont(ofSize: 14.0)
	}
	func addShadows() {
		let shadows = ShadowsHelper()
		shadows.addHelpShadows(button: backButton, view: hintBG)
	}
}
