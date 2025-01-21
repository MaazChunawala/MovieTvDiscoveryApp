import SwiftUI

struct TVShowRowView: View {
    let tvShow: TVShow

    var body: some View {
        HStack {
            if let imageURL = URL(string: tvShow.poster) {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            }
            VStack(alignment: .leading) {
                Text(tvShow.title)
                    .font(.headline)
                Text(tvShow.releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}
