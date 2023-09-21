import UIKit

/// 선택 or 선택 해제
protocol ClickedTendencyProtocol:UIView {
    func onSelected()
}

class TendencyCell:UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static var identifier :String{
        return String(describing: self)
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public var view:ClickedTendencyProtocol?{
        didSet{
            setupUI()
        }
    }
    
    private func setupUI(){

        guard let view = view else { return }
        self.contentView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor , constant: 5),
            view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor , constant: -5) ,
            view.topAnchor.constraint(equalTo: self.topAnchor , constant: 5),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: -5)

        ])
    }
}
