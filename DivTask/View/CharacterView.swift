import UIKit

final class CharacterView: UIView {
    private let titleLabel = LabelFactory.createTitleLabel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 32
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
        backgroundColor = UIColor(named: "customBackground")
//        backgroundColor = .red
        
        addSubview(titleLabel)
        addSubview(collectionView)
    }
}

private extension CharacterView {
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                
                collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
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
}
