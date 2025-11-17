//
//  RadioView.swift
//  Apple Music
//
//  Created by Mattia Boccia on 16/11/25.
//
import SwiftUI

struct RadioView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            
            HStack(alignment: .center) {
                Text("Radio")
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

            
            VStack {
                Image("radio")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    RadioView()
}
