//
//  EmpaticaPlayer.swift
//  StopWatch
//
//  Created by Sofia Fulgido on 27/03/21.
//

import Foundation

struct EmpaticaPlayer: Codable {
    var name: PersonalInfo
    var picture: ImageInfo
}

struct PersonalInfo: Codable {
    var title: String
    var first: String
    var last: String
}

struct ImageInfo: Codable {
    var thumbnail: String
}
