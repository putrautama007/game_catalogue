//
//  Developer.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct Developer: Codable, Identifiable{
    var id : Int
    var name : String
    var gamesCount : Int
    var backgroundImage : String
    var games : [DeveloperGameList]

    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gamesCount = "games_count"
        case backgroundImage = "image_background"
        case games
    }
}
