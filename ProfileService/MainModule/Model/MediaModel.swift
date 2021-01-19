//
//  Media.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

struct Media {
    var id: String
    var username: String
    var mediaType: String
    var caption: String
    var mediaUrl: String
    var permalink: String?
    var timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, caption, timestamp
        case mediaType = "media_type"
        case mediaLink = "media_url"
    }
}
