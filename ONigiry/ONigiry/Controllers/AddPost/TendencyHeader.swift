import UIKit
class TendencyHeader: UICollectionReusableView {
    /// 타이틀 라벨
    lazy var titleLabel:UILabel = {
       let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    /// 레이아웃 세팅
    func setupUI(){
        self.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
