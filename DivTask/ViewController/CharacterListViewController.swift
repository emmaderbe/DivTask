import UIKit

final class CharacterListViewController: UIViewController {
    private let characterView = CharacterView()
    private let dataSource = CharacterListDataSource()
    private let delegate = CharacterListDelegate()
    private var viewModel: CharactersViewModelProtocol
    
    init(viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = characterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension CharacterListViewController {
    func setupView() {
        characterView.setDataSource(with: dataSource)
        characterView.setDelegate(with: delegate)
        
        setupTitle()
        bindViewModel()
    }
    
    func setupTitle() {
        characterView.setupTitle(with: "Characters")
    }
    
    func bindViewModel() {
        viewModel.fetchCharacters()
        viewModel.didUpdateCharacters = { [weak self] in
            guard let self = self else { return }
            self.dataSource.updateCharacters(self.viewModel.characters)
            self.characterView.reloadCollection()
        }
    }
}
