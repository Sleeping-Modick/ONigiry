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
        textView.customTextView()
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
    
    let addKeyWord: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    lazy var keyWordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.horizontalStackView(spacing: 0)
        return stackView
    }()
    
    lazy var tendencyView : TendencyCV = {
        let tendency1 = Tendency(title: "Swift", clicked: false)
        let tendency2 = Tendency(title: "iOS", clicked: false)
        let tendency3 = Tendency(title: "코딩", clicked: false)
        let tendency4 = Tendency(title: "내배캠", clicked: false)
        let tendency5 = Tendency(title: "내배캠", clicked: false)
        let tendency6 = Tendency(title: "내배캠", clicked: false)
        let tendency7 = Tendency(title: "내배캠", clicked: false)
        let tendency8 = Tendency(title: "내배캠", clicked: false)

        let tendencyList1 = [tendency1,tendency2,tendency3,tendency4, tendency5, tendency6, tendency7]
        let tendencyHeader1 = TendencyHeaders(tendencyList: tendencyList1)
        
        let headers = [tendencyHeader1] //, tendencyHeader2]
        
        let tendencyView = TendencyCV(items: headers)
        
        tendencyView.translatesAutoresizingMaskIntoConstraints = false
        return tendencyView
    }()
}
