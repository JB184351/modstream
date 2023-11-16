//
//  VideoThumbNailView.swift
//  modstream
//
//  Created by Justin on 11/15/23.
//

import SwiftUI

struct VideoThumbNailView: View {
    let video: Video = Video(title: "Happy Gilmore", isMovie: true, duration: "92 Min", episode: nil, season: nil, platform: "Netflix", airDate: Date.distantPast, genre: "Comedy", thumbNail: "Image")
    
    var body: some View {
        VStack {
            Image(video.thumbNail ?? "")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            
            HStack {
                Spacer()
                Text(video.platform)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
            
            
            HStack {
                Text(video.duration)
                    .foregroundStyle(.white)
                    .bold()
                
                Spacer()
                
                Text(video.genre)
                    .foregroundStyle(.yellow)
            }
            .font(.caption)
            .padding(.leading)
            
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
