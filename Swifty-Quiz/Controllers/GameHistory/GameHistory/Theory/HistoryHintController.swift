
//  Created by Евгений Никитин on 09.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class HistoryHintController: UIViewController {

	@IBOutlet weak var hintView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var separatorHeight: NSLayoutConstraint!
	
    @IBOutlet weak var hintTextLabel: UILabel! {
        didSet {
            hintTextLabel.text = helpText
        }
    }
    
    var helpText: String = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setShadows()
		setThinSeparator()
		setFontSize()
    }
    
    private func setThinSeparator() {
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    private func setFontSize() {
        let width = view.frame.size.width
        hintTextLabel.font = width <= 320 ? UIFont.systemFont(ofSize: 12.0) : UIFont.systemFont(ofSize: 14.0)
    }
    
    private func setShadows() {
        let shadows = ShadowsHelper()
        shadows.addHelpShadows(button: backButton, view: hintView)
    }
}


// MARK: Dismissing
extension HistoryHintController {
	
    @IBAction func backToHistoryTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         if touch?.view != self.hintView {
            dismissing()
        }
    }
	
	private func dismissing() {
		dismiss(animated: true)
	}
}
