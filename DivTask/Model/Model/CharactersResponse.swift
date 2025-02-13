import Foundation

struct CharactersResponse: Decodable {
    let results: [Character]
}

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: CharacterLocation
    let image: String
}

struct CharacterLocation: Decodable {
    let name: String
}
