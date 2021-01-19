//
//  ProfileInfo.swift
//  ProfileService
//
//  Created by Bogdan Pohidnya on 18.01.2021.
//

import Foundation

enum UserModel {
    
    case initial
    case loading
    case failure
    case success(User)
    
    struct User: Decodable {
        var id: String
        var accountType: String
        var mediaCount: Int
        var username: String
        var media: MediaDataResponse
        
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
    
}
