//
//  VidePlayerView.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/8.
//

import SwiftUI
import AVKit

struct VidePlayerView: UIViewControllerRepresentable {
    var video :String
    
    func makeUIViewController(context: Context) ->  AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        var bound_url = Bundle.main.path(forResource: video, ofType: "mp4")
        
        let video_url = URL(fileURLWithPath: bound_url!)
        
        let player = AVPlayer(url: video_url)
        
        controller.player = player
        controller.showsPlaybackControls = true
        controller.videoGravity = .resizeAspectFill
        controller.player?.play()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
}

