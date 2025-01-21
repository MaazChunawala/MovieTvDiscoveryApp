import Foundation

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let poster: String
}

struct MovieResponse: Decodable {
    let titles: [Movie]
}
