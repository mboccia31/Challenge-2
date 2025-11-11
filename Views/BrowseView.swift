//
//  BrowseView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 06/11/25.
//

import SwiftUI

struct BrowseView: View {
    let categories = ["Pop", "Rock", "Hip-Hop", "R&B", "Country", "Jazz", "Classical", "Electronic"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Browse Categories
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCardView(title: category)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Browse")
        }
    }
}

struct CategoryCardView: View {
    let title: String
    let colors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .yellow, .indigo]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(colors.randomElement() ?? .red)
                .frame(height: 120)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    BrowseView()
}
