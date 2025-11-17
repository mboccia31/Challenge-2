import SwiftUI

// MARK: - Hero Playlist Card
private struct PlaylistHeroCardView: View {
    let imageName: String          
    let borderColor: Color
    let description: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
           
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(borderColor.opacity(0.95))
                .frame(height: 260)

           
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 260)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .padding(14)

           
            LinearGradient(
                colors: [.clear, .black.opacity(0.55)],
                startPoint: .center, endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .padding(14)

            Text(description)
                .font(.callout)
                .foregroundColor(.white.opacity(0.95))
                .padding(.horizontal, 22)
                .padding(.bottom, 24)
        }
        .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 6)
    }
}

// MARK: - Latest Songs Row
private struct SongRowCell: View {
    let song: Song
    var body: some View {
        HStack(spacing: 12) {
            Image(song.albumArt)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

            VStack(alignment: .leading, spacing: 2) {
                Text(song.title)
                    .font(.subheadline)
                    .lineLimit(1)
                Text(song.artist)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Image(systemName: "ellipsis")
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.leading, 8)
        }
        .contentShape(Rectangle())
    }
}

// MARK: - Large Album Tile (New Releases)
private struct LargeAlbumTile: View {
    let album: Album
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(album.coverArt)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 6)

            Text(album.name)
                .font(.headline)
                .lineLimit(1)
            Text(album.artist)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(width: 300, alignment: .leading)
    }
}

struct BrowseView: View {
    // dati
    private let songs = MusicDataService.shared.getSampleSongs()
    private let albums = MusicDataService.shared.getSampleAlbums()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {

                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            
                            Text("New")
                                .font(.largeTitle).bold()
                           
                        }
                        Spacer()
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("New Releases")
                                .font(.title2).bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                        .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(albums.prefix(4)) { album in
                                    LargeAlbumTile(album: album)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 4)
                        }
                    }

                    // Latest Songs
                    VStack(alignment: .leading, spacing: 14) {
                        HStack {
                            Text("Latest Songs")
                                .font(.title2).bold()
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                        .padding(.horizontal)

                        VStack(spacing: 12) {
                            ForEach(songs.prefix(4), id: \.title) { s in
                                SongRowView(song: s)
                                    .padding(.horizontal, 35)
                                Divider()
                                    .padding(.leading, 64) 
                            }
                        }
                    }

                   
                }
                .padding(.bottom, 40)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    BrowseView()
}
