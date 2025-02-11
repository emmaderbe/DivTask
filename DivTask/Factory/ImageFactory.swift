import UIKit

final class ImageFactory {
    static func createCharacterImageView() -> UIImageView {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = false
        image.layer.shadowOffset = CGSize(width: 0, height: 10)
        image.layer.shadowRadius = 10
        image.layer.shadowOpacity = 0.1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    static func createIconImageView(with imageName: String, and color: String) -> UIImageView {
       let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.tintColor = UIColor(named: color)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
