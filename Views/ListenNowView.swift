//
//  ListenNowView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

// MARK: - Album card compatta
struct AlbumCardView: View {
    let album: Album
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.15))
                .frame(width: 160, height: 160)
                .overlay(
                    Image(album.coverArt)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                )
            
            Text(album.name)
                .font(.subheadline).fontWeight(.semibold)
                .lineLimit(1)
            
            Text(album.artist)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .frame(width: 160)
    }
}

// (Lasciata per eventuale riuso, non più usata nella prima sezione)
struct TopPickCardView: View {
    let title: String
    let subtitle: String
    let imageName: String
    let footSubtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 4)
            
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 300, height: 360)
                    .overlay(
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    )
                
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black.opacity(0.6)]),
                    startPoint: .center,
                    endPoint: .bottom
                )
                .clipShape(RoundedRectangle(cornerRadius: 18))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.title3).bold()
                        .foregroundColor(.white)
                        .lineLimit(2)
                    Text(footSubtitle)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(16)
            }
        }
        .frame(width: 300)
    }
}

// MARK: - Card stile Apple Music "Mix"
struct MixCardView: View {
    let title: String
    let gradient: [Color]
    let artistsLine: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(LinearGradient(colors: gradient,
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .frame(width: 300, height: 360)
                .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 6)
            
            VStack(alignment: .leading, spacing: 0) {
                // Music
                HStack(spacing: 6) {
                    Image(systemName: "apple.logo").font(.headline)
                    Text("Music").font(.headline).fontWeight(.semibold)
                }
                .foregroundColor(.white.opacity(0.95))
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Spacer(minLength: 0)
                
                // “Chill Mix”
                VStack(alignment: .leading, spacing: -2) {
                    Text(title)
                        .font(.system(size: 42, weight: .bold))
                    Text("Mix")
                        .font(.system(size: 42, weight: .regular))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 130)
                
                // Artists
                ZStack {
                    Rectangle()
                        .fill(Color.black.opacity(0.25))
                        .frame(height: 70)
                        .clipShape(RoundedCorner(radius: 26, corners: [.bottomLeft, .bottomRight]))
                    
                    Text(artistsLine)
                        .font(.callout)
                        .foregroundColor(.white.opacity(0.95))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding(.horizontal, 16)
                }
            }
            .frame(width: 300, height: 360)
        }
        .frame(width: 300, height: 360)
    }
}

// Helper per arrotondare solo alcuni angoli
struct RoundedCorner: Shape {
    var radius: CGFloat = 12
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct ListenNowView: View {
    let albums = MusicDataService.shared.getSampleAlbums()
    
    @State private var recentlyPlayedShuffled: [Album] = []
    @State private var suggestedShuffled: [Album] = []
    @State private var songsYouLoveShuffled: [Album] = []
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                ScrollView {
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ScrollOffsetKey.self,
                                        value: geo.frame(in: .named("scroll")).minY)
                    }
                    .frame(height: 1)
                    
                    VStack(spacing: 20) {
                        header
                        madeForYouSection   
                        section(title: "Recently Played", data: recentlyPlayedShuffled)
                        section(title: "Suggested For You", data: suggestedShuffled)
                        section(title: "Songs You Love", data: songsYouLoveShuffled)
                    }
                    .padding(.bottom, 24)
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetKey.self) { value in
                    withAnimation(.easeInOut(duration: 0.15)) {
                        scrollOffset = value
                    }
                }
                
                // Sfumatura in alto, come Apple Music
                LinearGradient(
                    colors: [
                        Color(.systemBackground).opacity(min(0.6, max(0, Double(-scrollOffset / 100)))),
                        Color(.systemBackground).opacity(0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 90)
                .ignoresSafeArea(edges: .top)
                .allowsHitTesting(false)
            }
            .navigationBarHidden(true)
            .onAppear { reshuffleAll() }
        }
    }
    
    private var header: some View {
        HStack(alignment: .center) {
            Text("Home")
                .font(.largeTitle).bold()
            Spacer()
            Image("profile")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
    
    // MARK: - Made for You
    private var madeForYouSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Made for You")
                .font(.title2).bold()
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    MixCardView(
                        title: "Chill",
                        gradient: [Color.blue.opacity(0.85), Color.green.opacity(0.75)],
                        artistsLine: "The Weekend, SZA, Taylor Swift, Dua Lipa and more"
                    )
                    MixCardView(
                        title: "New Music",
                        gradient: [Color.pink.opacity(0.9), Color.orange.opacity(0.85)],
                        artistsLine: "Harry Styles, Lil Nas X, Bruno Mars and more"
                    )
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func section(title: String, data: [Album]) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(title)
                    .font(.title2).bold()
                
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(data) { album in
                        AlbumCardView(album: album)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private func reshuffleAll() {
        recentlyPlayedShuffled = albums.shuffled()
        suggestedShuffled      = albums.shuffled()
        songsYouLoveShuffled   = albums.shuffled()
    }
}

// PreferenceKey per lo scroll
private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ListenNowView()
}
