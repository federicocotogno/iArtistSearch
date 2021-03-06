//
//  ItemView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct ItemView: View {
    let search: Search
    let dimensions: Double = 100
    
    var body: some View {
        HStack() {
            // MARK: - Artwork
            VStack {
                AsyncImage(url: URL(string: search.artworkUrl100)!) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                    
                }
                .background(.thinMaterial)
                .cornerRadius(10)
                Text("\(search.releaseDate.formatZTime())")
                    .font(.subheadline)
            }
            Spacer()
            
            // MARK: - Artist Details
            VStack(alignment: .trailing) {
                Text("\(search.trackName)")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text("\(search.artistName)")
                    .font(.subheadline)
                    .lineLimit(1)
                Text("\(search.trackTimeMillis/1000/60) min")
                    .font(.subheadline)
            }

        }
        .padding()
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(search: Search.sampleSearch)
            .padding()
    }
}
