import UIKit

final class CharacterCell: UICollectionViewCell {
    private let imageContainerView = ImageFactory.createCharacterImageContainerView()
    private let characterImageView = ImageFactory.createCharacterImageView()
    
    private let nameLabel = LabelFactory.createSubtitleLabel()
    private let infoLabel = LabelFactory.createOrdinaryLabel(with: ColorEnum.accentColor, and: .regular)
    
    private let episodesButton = ButtonFactory.createButton(with: UIImage(named: ViewEnums.CharacterCell.Icon.episodesBttn), and: ColorEnum.accentOrange)
    
    private let locationStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = ViewEnums.CharacterCell.Constraints.stackSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    private let locationIcon = ImageFactory.createIconImageView(with: ViewEnums.CharacterCell.Icon.location, and: ColorEnum.accentGrey)
    private let locationLabel = LabelFactory.createOrdinaryLabel(with: ColorEnum.accentGrey, and: .regular)
    
    private let statusTag = LabelFactory.createOrdinaryLabel(with: ColorEnum.accentGrey, and: .medium)
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
        
        addSubview(imageContainerView)
        addSubview(nameLabel)
        addSubview(infoLabel)
        addSubview(episodesButton)
        addSubview(locationStack)
        addSubview(statusBackgroundView)
        
        imageContainerView.addSubview(characterImageView)
        
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
            imageContainerView.topAnchor.constraint(equalTo: topAnchor),
            imageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageContainerView.widthAnchor.constraint(equalToConstant: ViewEnums.CharacterCell.Constraints.characterImageViewHeight),
            imageContainerView.heightAnchor.constraint(equalTo: imageContainerView.widthAnchor),
            
            characterImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
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
        
        setupImage(with: data)
        setupTag(with: data)
        
    }
}

private extension CharacterCell {
    func setupImage(with data: CharacterCellModel) {
        if let imageData = data.image {
            let image = UIImage(data: imageData)
            
            if data.status == .dead {
                characterImageView.image = image?.applyGrayscale()
            } else {
                characterImageView.image = image
            }
        } else {
            characterImageView.image = nil
            characterImageView.backgroundColor = .customUnknownBackground
        }
    }
    
    func setupTag(with data: CharacterCellModel) {
        statusTag.textColor = UIColor(named: data.statusColorScheme.textColorName)
        statusBackgroundView.backgroundColor = UIColor(named: data.statusColorScheme.backgroundColorName)
    }
}

extension CharacterCell {
    static var identifier: String {
        String(describing: CharacterCell.self)
    }
}
