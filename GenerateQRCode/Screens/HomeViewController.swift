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
		configure()
	}
	
	private func configure() {
		title = "Generate QR Code"
		navigationController?.navigationBar.prefersLargeTitles = true
		homeView.configDelegateTextField(delegate: self)
		dismissKeyBoardTapGesture()
	}
	
	func generateQRCode(from string: String) -> UIImage? {
		let data = string.data(using: String.Encoding.ascii)
		
		if let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
			qrFilter.setValue(data, forKey: "inputMessage")
			guard let qrImage = qrFilter.outputImage else {return nil}
			
			let transformScale = CGAffineTransform(scaleX: 5.0, y: 5.0)
			let scaledQRImage = qrImage.transformed(by: transformScale)
			
			return UIImage(ciImage: scaledQRImage)
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

