import Foundation

enum NetworkError: Error {
    case invalidURL
    case clientError
    case serverError
    case noData
    case decodingError
    case unknown
}

enum APIConstants {
    static let baseURL = "https://rickandmortyapi.com/api/character"
}
