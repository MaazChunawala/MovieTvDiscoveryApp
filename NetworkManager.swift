import Foundation
import Combine

class NetworkManager {
    private let apiKey = "XeYxSSbzANxE2kcuT0j63MjQDGNKSfUwqp8JgUbP"

    func fetchMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "https://api.watchmode.com/v1/list-titles/?apiKey=\(apiKey)&types=movie")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map { $0.titles }
            .eraseToAnyPublisher()
    }

    func fetchTVShows() -> AnyPublisher<[TVShow], Error> {
        let url = URL(string: "https://api.watchmode.com/v1/list-titles/?apiKey=\(apiKey)&types=tv")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: TVShowResponse.self, decoder: JSONDecoder())
            .map { $0.titles }
            .eraseToAnyPublisher()
    }
}
