import UIKit

final class LabelFactory {
    static func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SF UI Text Bold", size: 31)
        label.textColor = UIColor(named: "AccentColor")
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SF UI Text Medium", size: 21)
        label.textColor = UIColor(named: "AccentColor")
        label.numberOfLines = 1
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    
    static func createTagLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SF UI Text Medium", size: 14)
        label.textColor = UIColor(named: "AccentColor")
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createOrdinaryLabel(with color: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "SF UI Text", size: 14)
        label.textColor = UIColor(named: color)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
