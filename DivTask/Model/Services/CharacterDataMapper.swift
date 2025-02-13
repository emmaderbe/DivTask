import Foundation

protocol CharacterDataMapperProtocol {
    func map(_ characters: [Character]) -> [CharacterCellModel]
}

final class CharacterDataMapper: CharacterDataMapperProtocol {
    func map(_ characters: [Character]) -> [CharacterCellModel] {
        characters.map { character in
            CharacterCellModel(
                name: character.name,
                info: "\(character.species), \(character.gender)",
                location: character.location.name,
                status: CharacterStatus(rawValue: character.status) ?? .unknown,
                imageURL: character.image
            )
        }
    }
}
