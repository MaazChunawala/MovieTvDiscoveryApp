import SwiftUI

struct DetailView: View {
    let movie: Movie

    var body: some View {
        VStack {
            if let imageURL = URL(string: movie.poster) {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 300)
                .cornerRadius(8)
            }
            
            Text(movie.title)
                .font(.title)
                .padding(.top, 10)

            Text("Release Date: \(movie.releaseDate)")
                .font(.subheadline)
                .padding(.top, 5)

            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(id: 1, title: "Sample Movie", releaseDate: "2025-01-01", poster: "https://sample-poster-url.com/poster.jpg"))
    }
}
