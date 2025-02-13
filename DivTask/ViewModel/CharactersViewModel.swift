import Foundation

protocol CharactersViewModelProtocol: AnyObject {
    var characters: [CharacterCellModel] { get }
    var didUpdateCharacters: (() -> Void)? { get set }
    func fetchCharacters()
}

final class CharactersViewModel: CharactersViewModelProtocol {
    private let networkService: NetworkServiceProtocol
    var characters: [CharacterCellModel] = []
    var didUpdateCharacters: (() -> Void)?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

extension CharactersViewModel {
    func fetchCharacters() {
        networkService.fetchCharacters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let characters):
                self.characters = characters
                self.didUpdateCharacters?()
            case .failure(let error):
                print("Failed to fetch characters: \(error)")
            }
        }
    }
}
