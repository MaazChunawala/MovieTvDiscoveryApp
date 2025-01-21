import Foundation

struct TVShow: Identifiable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let poster: String
}

struct TVShowResponse: Decodable {
    let titles: [TVShow]
}
