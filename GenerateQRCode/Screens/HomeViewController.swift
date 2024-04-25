//
//  ViewController.swift
//  GenerateQRCode
//
//  Created by Jadië Oliveira on 25/04/24.
//

import UIKit

class HomeViewController: UIViewController {
	
	let homeView = HomeView()
	
	override func loadView() {
		view = homeView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemPink
		title = "Generate QR Code"
		navigationController?.navigationBar.prefersLargeTitles = true
		homeView.configDelegateTextField(delegate: self)
		dismissKeyBoardTapGesture()
	}
	
	func dismissKeyBoardTapGesture() {
			let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
			view.addGestureRecognizer(tap)
		}
	
	func generateQRCode(from string: String) -> UIImage? {
		let data = string.data(using: String.Encoding.ascii)

		if let filter = CIFilter(name: "CIQRCodeGenerator") {
			filter.setValue(data, forKey: "inputMessage")
			let transform = CGAffineTransform(scaleX: 3, y: 3)

			if let output = filter.outputImage?.transformed(by: transform) {
				return UIImage(ciImage: output)
			}
		}

		return nil
	}
}

extension HomeViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		homeView.codeImage.image = generateQRCode(from: textField.text ?? "")
		textField.resignFirstResponder()
		return true
	}
}

