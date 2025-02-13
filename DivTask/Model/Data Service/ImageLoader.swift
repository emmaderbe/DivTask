import Foundation

protocol ImageLoaderProtocol {
    func loadImage(from url: URL, completion: @escaping (Data?) -> Void)
}

final class ImageLoader: ImageLoaderProtocol {
    private let cache = NSCache<NSURL, NSData>()

    func loadImage(from url: URL, completion: @escaping (Data?) -> Void) {
        if let cachedData = cache.object(forKey: url as NSURL) {
            completion(cachedData as Data)
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data, error == nil else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            self?.cache.setObject(data as NSData, forKey: url as NSURL)
            DispatchQueue.main.async { completion(data) }
        }.resume()
    }
}

