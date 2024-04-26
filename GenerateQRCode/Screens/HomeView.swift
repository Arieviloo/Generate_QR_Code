import UIKit

class HomeView: UIView {
	let textField = GFTextField()
	
	lazy var codeImage: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		
		return $0
	}(UIImageView())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configAddView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func configDelegateTextField(delegate: UITextFieldDelegate) {
		self.textField.delegate = delegate
	}
	
	private func configAddView() {
		addSubview(textField)
		addSubview(codeImage)
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			textField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
			textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
			textField.heightAnchor.constraint(equalToConstant: 40),
			
			codeImage.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
			codeImage.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
			codeImage.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
			codeImage.heightAnchor.constraint(equalToConstant: 300),
		])
	}
}
