import UIKit

class TendencyItem: UIView, ClickedTendencyProtocol {
    /// 타이틀 변수
    public let title: String
    var clicked = false

    /// 타이틀 라벨
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.text = self.title
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    /// 초기화
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 레이아웃 셋팅
    func setupUI() {
        self.backgroundColor = .lightGray
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }

    // 셀 선택시 타이틀과 배경색 변경
//    func changeBackgroundAndFont() {
//        if self.clicked {
//            self.backgroundColor = .black
//            self.titleLabel.textColor = .white
//        } else {
//            self.backgroundColor = .lightGray
//            self.titleLabel.textColor = .black
//        }
//    }
}

extension TendencyItem {
    func onSelected() {
        self.clicked = !self.clicked
        //self.changeBackgroundAndFont()
    }
}
