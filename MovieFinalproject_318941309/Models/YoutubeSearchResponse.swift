//
//  File.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 25/05/2022.
//

import Foundation

struct YoutubeSearchResponse : Codable {
    let items : [VideoElement]
}
struct VideoElement : Codable {
    let id : IdVideoElement
}

struct IdVideoElement : Codable {
    let kind: String
    let videoId: String
    
}
