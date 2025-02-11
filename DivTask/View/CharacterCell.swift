import UIKit

final class CharacterCell: UICollectionViewCell {
    
    private let characterImageView = ImageFactory.createCharacterImageView()
    private let nameLabel = LabelFactory.createSubtitleLabel()
    private let infoLabel = LabelFactory.createOrdinaryLabel(with: "AccentColor", and: .regular)
    
    private let episodesButton = ButtonFactory.createButton(with: UIImage(named: "polygon"), and: "customOrange")
    
    private let locationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private let locationIcon = ImageFactory.createIconImageView(with: "placeholder", and: "accentGrey")
    private let locationLabel = LabelFactory.createOrdinaryLabel(with: "accentGrey", and: .regular)
    
    private let statusTag = LabelFactory.createOrdinaryLabel(with: "accentGrey", and: .medium)
    private let statusBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        statusBackgroundView.layer.cornerRadius = statusBackgroundView.frame.height / 2
    }
}

private extension CharacterCell {
    func setupView() {
        backgroundColor = .clear
        
        addSubview(characterImageView)
        addSubview(nameLabel)
        addSubview(infoLabel)
        addSubview(episodesButton)
        addSubview(locationStack)
        addSubview(statusBackgroundView)
        
        locationStack.addArrangedSubview(locationIcon)
        locationStack.addArrangedSubview(locationLabel)
        
        statusBackgroundView.addSubview(statusTag)
    }

}

private extension CharacterCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 120),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 1),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 18),
            
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            episodesButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 12),
            episodesButton.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            
            locationStack.topAnchor.constraint(equalTo: episodesButton.bottomAnchor, constant: 10),
            locationStack.leadingAnchor.constraint(equalTo: episodesButton.leadingAnchor),
            
            statusBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            statusBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusBackgroundView.heightAnchor.constraint(greaterThanOrEqualTo: statusTag.heightAnchor, constant: 8),
            statusBackgroundView.widthAnchor.constraint(greaterThanOrEqualTo: statusTag.widthAnchor, constant: 16),
            
            statusTag.centerXAnchor.constraint(equalTo: statusBackgroundView.centerXAnchor),
            statusTag.centerYAnchor.constraint(equalTo: statusBackgroundView.centerYAnchor),
        ])
    }
}


extension CharacterCell {
    func setupText(name: String, info: String, bttn: String, location: String, status: String ) {
        nameLabel.text = name
        infoLabel.text = info
        episodesButton.setTitle(bttn, for: .normal)
        locationLabel.text = location
        statusTag.text = status
    }
    
    func setupImage(with image: String) {
        characterImageView.image = UIImage(named: image)
    }
    
    func setupStatusColor() {
        
    }
}

extension CharacterCell {
    static var identifier: String {
        String(describing: CharacterCell.self)
    }
}
