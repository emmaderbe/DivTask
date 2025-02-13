import UIKit

final class ImageFactory {
    static func createCharacterImageContainerView() -> UIView {
        let container = UIView()
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 10)
        container.layer.shadowRadius = 10
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }

    static func createCharacterImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    static func createIconImageView(with imageName: String, and color: String) -> UIImageView {
       let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.tintColor = UIColor(named: color)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
}
