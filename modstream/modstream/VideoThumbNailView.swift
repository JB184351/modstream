//
//  VideoThumbNailView.swift
//  modstream
//
//  Created by Justin on 11/15/23.
//

import SwiftUI

struct VideoThumbNailView: View {
    let video: Video = Video(title: "Happy Gilmore", isMovie: true, duration: "92 Min", episode: nil, season: nil, platform: "Netflix", airDate: Date.distantPast, genre: "Comedy", thumbNail: "Image", url:  "")
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Image(video.thumbNail ?? "")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            
            HStack {
                Text(video.title)
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
                Text(video.platform)
                    .foregroundStyle(.red)
                    .fontWeight(.bold)
                    .font(.caption)
            }
            
            
            HStack {
                Text(video.duration)
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
                Text(video.genre)
                    .foregroundStyle(.yellow)
                    .fontWeight(.bold)
            }
            .font(.caption)
            
        }
        .padding()
        .background(
            .black
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    VideoThumbNailView()
}
