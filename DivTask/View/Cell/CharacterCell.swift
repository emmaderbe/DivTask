import UIKit

final class CharacterCell: UICollectionViewCell {
    private let characterImageView = ImageFactory.createCharacterImageView()
    private let nameLabel = LabelFactory.createSubtitleLabel()
    private let infoLabel = LabelFactory.createOrdinaryLabel(with: ViewEnums.CharacterCell.Color.accentColor, and: .regular)
    
    private let episodesButton = ButtonFactory.createButton(with: UIImage(named: ViewEnums.CharacterCell.Icon.episodesBttn), and: ViewEnums.CharacterCell.Color.accentOrange)
    
    private let locationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = ViewEnums.CharacterCell.Constraints.stackSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private let locationIcon = ImageFactory.createIconImageView(with: ViewEnums.CharacterCell.Icon.location, and: ViewEnums.CharacterCell.Color.accentGrey)
    private let locationLabel = LabelFactory.createOrdinaryLabel(with: ViewEnums.CharacterCell.Color.accentGrey, and: .regular)
    
    private let statusTag = LabelFactory.createOrdinaryLabel(with: ViewEnums.CharacterCell.Color.accentGrey, and: .medium)
    private let statusBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupPriority()
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
    func setupPriority() {
        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        statusTag.setContentCompressionResistancePriority(.required, for: .horizontal)
        statusBackgroundView.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: ViewEnums.CharacterCell.Constraints.characterImageViewHeight),
            characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor, multiplier: 1),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: ViewEnums.CharacterCell.Constraints.nameLabelSpacing),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: statusTag.leadingAnchor, constant: -ViewEnums.CharacterCell.Constraints.nameLabelSpacing),
            
            infoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: ViewEnums.CharacterCell.Constraints.infoLabelTop),
            infoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            episodesButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: ViewEnums.CharacterCell.Constraints.episodesBttnTop),
            episodesButton.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            
            locationStack.topAnchor.constraint(equalTo: episodesButton.bottomAnchor, constant: ViewEnums.CharacterCell.Constraints.locationStackSpacing),
            locationStack.leadingAnchor.constraint(equalTo: episodesButton.leadingAnchor),
            
            statusBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            statusBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusBackgroundView.heightAnchor.constraint(greaterThanOrEqualTo: statusTag.heightAnchor, constant: ViewEnums.CharacterCell.Constraints.statusBackgroundHeight),
            statusBackgroundView.widthAnchor.constraint(greaterThanOrEqualTo: statusTag.widthAnchor, constant: ViewEnums.CharacterCell.Constraints.statusBackgroundWidth),
            
            statusTag.centerXAnchor.constraint(equalTo: statusBackgroundView.centerXAnchor),
            statusTag.centerYAnchor.constraint(equalTo: statusBackgroundView.centerYAnchor),
        ])
    }
}


extension CharacterCell {
    func setupCell(with data: CharacterCellModel) {
        nameLabel.text = data.name
        infoLabel.text = data.info
        episodesButton.setTitle(data.buttonTitle, for: .normal)
        locationLabel.text = data.location
        statusTag.text = data.statusText
        
        characterImageView.image = UIImage(named: data.imageURL)
        
        statusTag.textColor = UIColor(named: data.statusColorScheme.textColorName)
            statusBackgroundView.backgroundColor = UIColor(named: data.statusColorScheme.backgroundColorName)
    }
}

extension CharacterCell {
    static var identifier: String {
        String(describing: CharacterCell.self)
    }
}
