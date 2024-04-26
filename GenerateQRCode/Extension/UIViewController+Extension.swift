import UIKit

extension UIViewController {
	func dismissKeyBoardTapGesture() {
			let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
			view.addGestureRecognizer(tap)
		}
}
