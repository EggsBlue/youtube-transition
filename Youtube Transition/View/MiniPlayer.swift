//
//  MiniPlayer.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/8.
//

import SwiftUI

struct MiniPlayer: View {
   
    @EnvironmentObject var player: VideoPlayerViewMode
    
    @Binding var video : Video
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                VidePlayerView(video: video.url)
                    .frame(width: player.isMiniPlayer ? 150 : player.width, height: player.isMiniPlayer ? 70 : getFrame())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                // Controls...
                VideoControls(video: $video)
            )
            .onTapGesture {
                if player.isMiniPlayer{
                    withAnimation {
                        player.width = UIScreen.main.bounds.width
                        player.isMiniPlayer.toggle()
                    }
                }
                
            }
            
            GeometryReader(){ reader in
                
                ScrollView {
                    VStack(spacing: 18){
                        
                        VStack(alignment: .leading, spacing: 8){
                            
                            Text(video.title)
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .frame(width: 500)
                                .padding(.trailing, 15)
                            
                            Text("1.2M Views")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Buttons...
                        ScrollView(.horizontal, showsIndicators:false) {
                            HStack(){
                                PlayBackVideoButtons(image: "hand.thumbsup", text: "123K")
                                
                                PlayBackVideoButtons(image: "hand.thumbsdown", text: "1K")
                                
                                PlayBackVideoButtons(image: "square.and.arrow.up", text: "Share")
                                
                                PlayBackVideoButtons(image: "square.and.arrow.down", text: "Download")
                                
                                PlayBackVideoButtons(image: "message", text: "Live Chat")
                            }
                        }
                        Divider()
                        
                        VStack(spacing: 15){
                            ForEach(videos){ video in
                                // video card view
                                VideoCardView(video: video)
                            }
                        }
                    }
                }
                .onAppear {
                    player.height = reader.frame(in: .global)
                        .height + 250
                }
                
            }
            .background(Color.white)
            .opacity(player.isMiniPlayer ? 0: getOpacity())
            .frame(height: player.isMiniPlayer ? 0 : nil)
        }
        .background(
            Color.white
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        player.width = UIScreen.main.bounds.width
                        player.isMiniPlayer.toggle()
                    }
                })
    }
    
    
    
    func getFrame() -> CGFloat{
        let progress = player.offset/(player.height - 100)
        
        if (1 - progress) <= 1.0 {
            
            let videoHeight : CGFloat = (1 - progress) * 250
            
            if videoHeight <= 70{
                
                let precent = videoHeight / 70
                
                let videoWiedth: CGFloat = precent * UIScreen.main.bounds.width
                
                DispatchQueue.main.async {
                    if videoWiedth >= 150{
                        player.width = videoWiedth
                    }
                }
                
                return 70
            }
            
            DispatchQueue.main.async {
                player.width = UIScreen.main.bounds.width
            }
            
            return videoHeight
        }
        
        print(progress)
        
        return 250
    }
    
    func getOpacity() -> Double{
        
        let progress = player.offset / (player.height)
        if progress <= 1{
            return Double( 1 - progress)
        }
        
        return 1
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
//        Home()
        MiniPlayer( video: .constant(videos[0]))
            .environmentObject(VideoPlayerViewMode())
    }
}

struct PlayBackVideoButtons: View {
    var image: String
    var text: String
    
    var body: some View {
        Button {
            
        } label: {
            VStack(spacing: 8){
                
                Image(systemName: image)
                    .font(.title3)
                
                Text(text)
                    .fontWeight(.semibold)
                    .font(.caption)
                
            }
            .foregroundColor(.black) 
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal,15)
    }
}

struct VideoControls: View{
    @EnvironmentObject var player: VideoPlayerViewMode
    @Binding var video: Video
    
    var body: some View{
        
        HStack(spacing: 8){
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150,height :70)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(video.title)
                    .font(.callout)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Text(video.author)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            
            Button {
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
                    .foregroundColor(.black)
            }

            
            Button {
                print("---")
                player.showPlayer.toggle()
                player.offset = 0
                player.isMiniPlayer.toggle()
                
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
        }
        .padding(.trailing)
    }
}
