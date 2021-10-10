//
//  Video.swift
//  Youtube Transition
//
//  Created by 王庆华 on 2021/10/8.
//

import Foundation

struct Video: Identifiable{
    var id = UUID().uuidString
    var image: String
    var author: String
    var title: String
    var url : String
    
}


var videos = [
    Video(image : "thumb5",author:"蛋蛋的忧伤", title : "Why we love Trump?",url:"video"),
    Video(image : "taylor1",author:"蛋蛋的忧伤", title : "【4K收藏级画质】霉霉神级LoveStory现场！！!",url:"taylor1"),
    Video(image : "taylor2",author:"蛋蛋的忧伤", title : "【Taylor Swift】[4K修复] Red (CMA Awards 2013)",url:"【Taylor Swift】[4K修复] Red (CMA Awards 2013) - 001 - [4K修复] Red (CMA Awards 2013)"),
    Video(image : "thumb1",author:"蛋蛋的忧伤", title : "美哭了！！万人大合唱！Taylor Swift世界巡演《Love Story》！真正的视觉与听觉享受，超级震撼的舞台效果！据最神奇的视频 ",url:"美哭了！！万人大合唱！Taylor Swift世界巡演《Love Story》！真正的视觉与听觉享受，超级震撼的舞台效果！据最神奇的视频"),
    Video(image : "thumb2",author:"蛋蛋的忧伤", title : "懂王-川宝支持者精彩瞬间，从来没见拉稀乔有这种待遇。",url:"懂王-川宝支持者精彩瞬间，从来没见拉稀乔有这种待遇。 - 001 - 懂王-川宝支持者精彩瞬间，从来没见拉稀乔有这种待遇")
]
