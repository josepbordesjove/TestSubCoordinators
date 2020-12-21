import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: Float = 1) {
        self.init(red: CGFloat((hex >> 16) & 0xFF)/255,
                  green: CGFloat((hex >> 8) & 0xFF)/255,
                  blue: CGFloat(hex & 0xFF)/255,
                  alpha: CGFloat(alpha))
    }
}
