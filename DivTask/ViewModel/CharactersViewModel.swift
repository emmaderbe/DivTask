import Foundation

protocol CharactersViewModelProtocol: AnyObject {
    var didUpdateCharacters: (([CharacterCellModel]) -> Void)? { get set }
    func start()
}

final class CharactersViewModel: CharactersViewModelProtocol {
    private let networkService: NetworkServiceProtocol
    private let dataMapper: CharacterDataMapperProtocol
    private var characters: [CharacterCellModel] = []

    var didUpdateCharacters: (([CharacterCellModel]) -> Void)?

    init(networkService: NetworkServiceProtocol, dataMapper: CharacterDataMapperProtocol) {
        self.networkService = networkService
        self.dataMapper = dataMapper
    }

    func start() {
        fetchCharacters()
    }
}

private extension CharactersViewModel {
    func fetchCharacters() {
        networkService.fetchCharacters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let characters):
                self.characters = self.dataMapper.map(characters)
                self.didUpdateCharacters?(self.characters)
            case .failure(let error):
                print("Failed to fetch characters: \(error)")
            }
        }
    }
}

