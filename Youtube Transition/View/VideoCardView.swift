//
//  VideoCardView.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/8.
//

import SwiftUI

struct VideoCardView: View {
    var video: Video
    
    var body: some View {
        VStack(spacing:10){
            Image(video.image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(height: 250)
            
            
            HStack(spacing: 15){
                
                Image("logo")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 40, height: 40)
                   
                VStack(alignment: .leading, spacing: 6, content: {
                    
                    Text(video.title)
                        .fontWeight(.semibold)
                        .font(.callout)
                    
                    HStack{
                        Text(video.author)
                            .fontWeight(.bold)
                            .font(.caption)
                        
                        Text("12k Views. 5 Days Ago")
                            .font(.caption)
                    }.foregroundColor(.gray)
                    
                })
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
        }
        .padding(.horizontal)
        
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
