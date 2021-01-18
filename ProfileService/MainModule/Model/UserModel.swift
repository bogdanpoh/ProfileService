//
//  ProfileInfo.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

struct User: Decodable {
    let id: String
    let accountType: String
    let mediaCount: Int
    let username: String
    let media: MediaDataResponse
    
    enum CodingKeys: String, CodingKey {
        case id, username, media
        case accountType = "account_type"
        case mediaCount = "media_count"
    }
}

struct MediaDataResponse: Decodable {
    let data: [DataResponse]
}

struct DataResponse: Decodable {
    let id: String
}

