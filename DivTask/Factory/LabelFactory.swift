import UIKit

final class LabelFactory {
    static func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 31, weight: .bold)
        label.textColor = UIColor(named: "AccentColor")
        label.numberOfLines = 1
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.textColor = UIColor(named: "AccentColor")
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func createOrdinaryLabel(with color: String, and weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: weight)
        label.textColor = UIColor(named: color)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
