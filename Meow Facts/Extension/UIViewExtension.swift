import UIKit

extension UIView {
    public enum Shadow {
        case light
        case bold
    }
    
    public func addShadow(_ shadow: Shadow) {
        var multiplier: CGFloat
        switch shadow {
        case .light:
            multiplier = 0.5
        case .bold:
            multiplier = 1
        }
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = Float(0.4 * multiplier)
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4 * multiplier
    }
}
