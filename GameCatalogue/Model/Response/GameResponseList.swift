//
//  GameResponseList.swift
//  GameCatalogue
//
//  Created by Putra Utama on 13/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameResponseList: Codable {
    let results : [GameResponse]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    struct GameResponse: Codable {
        let id: Int?
        let name: String?
        let released: String?
        let backgroundImage: String?
        let rating: Float?
        let playtime: Int?
        let metacritic: Int?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case released
            case backgroundImage = "background_image"
            case rating
            case playtime
            case metacritic
        }
    }
}
