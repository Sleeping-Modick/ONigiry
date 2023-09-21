import UIKit


final class LabelView: UIView, UITextViewDelegate {
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.verticalStackView(spacing: 30)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let selectSection: UILabel = {
        let label = UILabel()
        label.customLabel(textColor: .black, font: UIFont.systemFont(ofSize: 17))
        return label
    }()
    
    let sectionTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "섹션 선택 🔽"
        return textField
    }()
    
    lazy var sectionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.horizontalStackView(spacing: 16)
        return stackView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.customLabel(textColor: .black, font: UIFont.systemFont(ofSize: 17))
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "제목 입력"
//        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return textField
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.horizontalStackView(spacing: 16)
        return stackView
    }()
    
    let content: UILabel = {
        let label = UILabel()
        label.customLabel(textColor: .black, font: UIFont.systemFont(ofSize: 17))
        return label
    }()
    
    lazy var contentTextView: UITextView = {
        let textView = UITextView()
        textView.text = "??"
        textView.delegate = self
        textView.isHidden = false
        textView.layer.borderWidth = 1.0
        textView.backgroundColor = .systemRed
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.clipsToBounds = true
        textView.contentInset = .init(top: 40, left: 30, bottom: 20, right: 10)
        textView.textContainerInset = .init(top: 40, left: 30, bottom: 20, right: 10)
        textView.scrollIndicatorInsets = .init(top: 10, left: 10, bottom: 10, right: 20)
        textView.layer.cornerRadius = 5.0
        textView.font = UIFont.systemFont(ofSize: 14.0)
        textView.isScrollEnabled = true
        textView.textContainer.maximumNumberOfLines = 5
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let addPhoto: UILabel = {
        let label = UILabel()
        label.customLabel(textColor: .black, font: UIFont.systemFont(ofSize: 17))
        return label
    }()
    
    let keyWord: UILabel = {
        let label = UILabel()
        label.customLabel(textColor: .black, font: UIFont.systemFont(ofSize: 17))
        return label
    }()
}
