import UIKit

extension UILabel {
    
    func customLabel(textColor: UIColor, font: UIFont){
        //self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor
        self.font = font
    }
}
