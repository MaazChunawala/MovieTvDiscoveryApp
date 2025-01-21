import SwiftUI

struct HomeView: View {
    @StateObject private var movieViewModel = MovieViewModel()
    @State private var selectedTab = "Movies"

    var body: some View {
        VStack {
            Picker("Select", selection: $selectedTab) {
                Text("Movies").tag("Movies")
                Text("TV Shows").tag("TV Shows")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if movieViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    LazyVStack {
                        if selectedTab == "Movies" {
                            ForEach(movieViewModel.movies, id: \.id) { movie in
                                MovieRowView(movie: movie)
                                    .onTapGesture {
                                        movieViewModel.selectMovie(movie: movie)
                                    }
                            }
                        } else {
                            ForEach(movieViewModel.tvShows, id: \.id) { tvShow in
                                TVShowRowView(tvShow: tvShow)
                                    .onTapGesture {
                                        movieViewModel.selectTVShow(tvShow: tvShow)
                                    }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            movieViewModel.fetchMoviesAndTVShows()
        }
        .alert(item: $movieViewModel.errorMessage) { errorWrapper in
            Alert(title: Text("Error"), message: Text(errorWrapper.message), dismissButton: .default(Text("OK")))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
