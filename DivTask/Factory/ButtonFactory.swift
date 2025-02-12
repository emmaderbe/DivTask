import UIKit

final class ButtonFactory {
    static func createButton(with icon: UIImage?, and color: String) -> UIButton {
        let button = UIButton()
        let customColor = UIColor(named: color) ?? .accent
        
        button.setTitleColor(customColor, for: .normal)
        button.backgroundColor = customColor.withAlphaComponent(0.1)
        button.layer.cornerRadius = 17
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if let icon = icon {
            button.setImage(icon.withRenderingMode(.alwaysTemplate), for: .normal)
            button.tintColor = customColor
            
            let iconWidth: CGFloat = icon.size.width
            button.contentEdgeInsets = UIEdgeInsets(top: 9, left: 12 + iconWidth, bottom: 9, right: 12)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        }
        
        return button
    }
}
