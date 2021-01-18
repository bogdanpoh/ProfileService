//
//  Media.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

struct Media {
    let id: String
    let username: String
    let mediaType: String
    let caption: String
    let mediaUrl: String
    let permalink: String?
    let timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case id, username, caption, timestamp
        case mediaType = "media_type"
        case mediaLink = "media_url"
    }
}
