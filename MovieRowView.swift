import SwiftUI

struct MovieRowView: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let imageURL = URL(string: movie.poster) {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}
