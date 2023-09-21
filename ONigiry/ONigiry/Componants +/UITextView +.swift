import UIKit

extension UITextView {
    
    func customTextView(){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
        self.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        self.textContainerInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        self.scrollIndicatorInsets = .init(top: 10, left: 10, bottom: 10, right: 20)
        self.layer.cornerRadius = 5.0
        self.font = UIFont.systemFont(ofSize: 14.0)
        self.isScrollEnabled = true
        //self.textContainer.maximumNumberOfLines = maximumNumberOfLines
        self.textContainer.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
