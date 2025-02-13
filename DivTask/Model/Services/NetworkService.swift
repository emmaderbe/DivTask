import Foundation

protocol NetworkServiceProtocol {
    func fetchCharacters(completion: @escaping (Result<[Character], NetworkError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private let urlSession = URLSession.shared
}

private extension NetworkService {
    func makeRequest() -> URLRequest? {
        guard let url = URL(string: APIConstants.baseURL) else { return nil }
        return URLRequest(url: url)
    }
}

extension NetworkService {
    func fetchCharacters(completion: @escaping (Result<[Character], NetworkError>) -> Void) {
        guard let request = makeRequest() else {
            DispatchQueue.main.async {
                completion(.failure(.invalidURL))
            }
            return
        }
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let _ = error {
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
                    DispatchQueue.main.async {
                        completion(.success(decodedData.results))
                    }
                } catch {
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
