import Foundation

protocol NetworkServiceProtocol {
    func fetchCharacters(completion: @escaping (Result<[CharacterCellModel], NetworkError>) -> Void)
}

enum NetworkError: Error {
    case invalidURL
    case clientError
    case serverError
    case noData
    case decodingError
    case unknown
}

final class NetworkService: NetworkServiceProtocol {
    private let urlSession = URLSession.shared
    private let baseURL = "https://rickandmortyapi.com/api/character"
}

private extension NetworkService {
    func makeRequest() -> URLRequest? {
        guard let url = URL(string: baseURL) else { return nil }
        return URLRequest(url: url)
    }
}

extension NetworkService {
    func fetchCharacters(completion: @escaping (Result<[CharacterCellModel], NetworkError>) -> Void) {
        guard let request = makeRequest() else {
            DispatchQueue.main.async {
                completion(.failure(.invalidURL))
            }
            return
        }

        let task = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(.failure(.unknown))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(.unknown))
                }
                return
            }

            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.noData))
                    }
                    return
                }

                do {
                    let decodedData = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    let cellModels = decodedData.results.map { character in
                        CharacterCellModel(
                            name: character.name,
                            info: "\(character.species), \(character.gender)",
                            buttonTitle: "Watch episodes",
                            location: character.location.name,
                            status: character.status.uppercased(),
                            imageURL: character.image
                        )
                    }
                    DispatchQueue.main.async {
                        completion(.success(cellModels))
                    }
                } catch {
                    print("Decoding Error: \(error)")
                    DispatchQueue.main.async {
                        completion(.failure(.decodingError))
                    }
                }

            case 400...499:
                DispatchQueue.main.async {
                    completion(.failure(.clientError))
                }
            case 500...599:
                DispatchQueue.main.async {
                    completion(.failure(.serverError))
                }
            default:
                DispatchQueue.main.async {
                    completion(.failure(.unknown))
                }
            }
        }
        task.resume()
    }
}
