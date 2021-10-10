//
//  VideoPlayerViewModel.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/9.
//

import SwiftUI

class VideoPlayerViewMode : ObservableObject{
    @Published var showPlayer = false
    
    @Published var offset : CGFloat = 0
    @Published var width : CGFloat = UIScreen.main.bounds.width
    @Published var height: CGFloat = 0
    @Published var isMiniPlayer = false
}
