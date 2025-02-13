import UIKit

final class CharacterView: UIView {
    private let titleLabel = LabelFactory.createTitleLabel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = ViewEnums.CharacterView.Constraints.collectionLayoutSpacing
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView
            .register(
                CharacterCell.self,
                forCellWithReuseIdentifier: CharacterCell.identifier
            )
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
}

private extension CharacterView {
    func setupView() {
        backgroundColor = UIColor(named: ViewEnums.CharacterView.Color.accentBackground)
        
        addSubview(titleLabel)
        addSubview(collectionView)
    }
}

private extension CharacterView {
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ViewEnums.CharacterView.Constraints.titleTop),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewEnums.CharacterView.Constraints.titleLeading),
                
                collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewEnums.CharacterView.Constraints.collectionSpacing),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}

extension CharacterView {
    func setupTitle(with title: String) {
        titleLabel.text = title
    }
    
    func setDataSource(with dataSource: CharacterListDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func setDelegate(with delegate: CharacterListDelegate) {
        collectionView.delegate = delegate
    }
    
    func reloadCollection() {
        collectionView.reloadData()
    }
}
