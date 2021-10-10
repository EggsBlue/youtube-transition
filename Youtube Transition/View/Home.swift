//
//  Home.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/8.
//

import SwiftUI

struct Home: View {
    @StateObject var player = VideoPlayerViewMode()
    
    @GestureState var gestureOffset: CGFloat = 0
    @State var video : Video = videos[0]
    
    var body: some View {
        
//        NavigationView{
        
            ZStack(alignment: .bottom){
                ScrollView{
                    VStack(spacing: 15){
                        ForEach(videos){ video in
                            // video card view
                            VideoCardView(video: video)
                                .onTapGesture {
                                    self.video = video
                                   
                                        if player.showPlayer{
                                            player.showPlayer.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                                                withAnimation {
                                                    player.isMiniPlayer.toggle()
                                                    player.showPlayer.toggle()
                                                }
                                               
                                            }
                                        }else{
                                            withAnimation {
                                                player.showPlayer.toggle()
                                            }
                                        }
                                        
                                   
                                }
                        }
                    }
                }
                
                // Video player view
                if player.showPlayer{
                    MiniPlayer(video: $video)
                        .transition(.move(edge: .bottom))
                        .offset(y: player.offset)
                        .gesture(
                            DragGesture()
                                    .updating($gestureOffset, body: { value, state, _ in
                            state = value.translation.height
                                    }).onEnded(onEnd(value:)))
                }
                
            }
            .onChange(of: gestureOffset) { value in
                onChanged()
            }
            .environmentObject(player)
            .navigationTitle("探索")
        
//        }
        
    }
    
    
    func onChanged(){
        if !player.isMiniPlayer && gestureOffset>0 && player.offset + 70 <= player.height  {
            player.offset = gestureOffset
        }
    }
    
    func onEnd(value: DragGesture.Value){
        
        withAnimation(.default){
            
            if !player.isMiniPlayer{
                player.offset = 0
                
                if value.translation.height > UIScreen.main.bounds.height / 3{
                    player.isMiniPlayer = true
                }else{
                    player.isMiniPlayer = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
