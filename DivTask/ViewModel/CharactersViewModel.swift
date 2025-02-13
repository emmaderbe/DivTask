import Foundation

protocol CharactersViewModelProtocol: AnyObject {
    var didUpdateCharacters: (([CharacterCellModel]) -> Void)? { get set }
    var didReceiveEmptyState: (() -> Void)? { get set }
    var didReceiveErrorState: (() -> Void)? { get set }
    func start()
}

final class CharactersViewModel: CharactersViewModelProtocol {
    private let networkService: NetworkServiceProtocol
    private let imageLoader: ImageLoaderProtocol
    private let dataMapper: CharacterDataMapperProtocol
    private var characters: [CharacterCellModel] = []
    
    var didUpdateCharacters: (([CharacterCellModel]) -> Void)?
    var didReceiveEmptyState: (() -> Void)?
    var didReceiveErrorState: (() -> Void)?
    
    init(networkService: NetworkServiceProtocol, dataMapper: CharacterDataMapperProtocol, imageLoader: ImageLoaderProtocol) {
        self.networkService = networkService
        self.dataMapper = dataMapper
        self.imageLoader = imageLoader
    }
    
    func start() {
        fetchCharacters()
    }
}

private extension CharactersViewModel {
    func fetchCharacters() {
        networkService.fetchCharacters { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let characters):
                let mappedCharacters = self.dataMapper.map(characters)
                if mappedCharacters.isEmpty {
                    self.didReceiveEmptyState?()
                } else {
                    self.characters = mappedCharacters
                    self.didUpdateCharacters?(self.characters)
                    self.loadImages()
                }
            case .failure(let error):
                self.didReceiveErrorState?()
                print("Failed to fetch characters: \(error)")
            }
        }
    }
    
    func loadImages() {
        for index in characters.indices {
            guard let url = characters[index].imageURL else { continue }
            
            imageLoader.loadImage(from: url) { [weak self] data in
                guard let self else { return }
                
                self.characters[index] = CharacterCellModel(
                    name: self.characters[index].name,
                    info: self.characters[index].info,
                    location: self.characters[index].location,
                    status: self.characters[index].status,
                    imageURL: self.characters[index].imageURL,
                    image: data
                )
                
                self.didUpdateCharacters?(self.characters)
            }
        }
    }
}

