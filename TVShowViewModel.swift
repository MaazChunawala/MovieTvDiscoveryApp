import Foundation
import Combine

class TVShowViewModel: ObservableObject {
    @Published var tvShows: [TVShow] = []
    @Published var errorMessage = ""

    private var cancellables = Set<AnyCancellable>()
    private let networkManager = NetworkManager()

    func fetchTVShows() {
        networkManager.fetchTVShows()
            .receive(on: DispatchQueue.main) // Ensure updates happen on the main thread
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.errorMessage = "Failed to load TV shows: \(error.localizedDescription)"
                    }
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] tvShows in
                DispatchQueue.main.async {
                    self?.tvShows = tvShows
                }
            })
            .store(in: &cancellables)
    }
}
