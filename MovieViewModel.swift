import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var tvShows: [TVShow] = []
    @Published var isLoading = true
    @Published var errorMessage: ErrorWrapper?

    private var cancellables = Set<AnyCancellable>()
    private let networkManager = NetworkManager()

    func fetchMoviesAndTVShows() {
        isLoading = true
        Publishers.Zip(networkManager.fetchMovies(), networkManager.fetchTVShows())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = ErrorWrapper(message: error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { movies, tvShows in
                self.movies = movies
                self.tvShows = tvShows
                self.isLoading = false
            })
            .store(in: &cancellables)
    }

    func selectMovie(movie: Movie) {
        // Handle movie selection
    }

    func selectTVShow(tvShow: TVShow) {
        // Handle TV show selection
    }
}
