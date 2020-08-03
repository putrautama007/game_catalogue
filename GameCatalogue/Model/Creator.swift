//
//  Creator.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct Creator: Codable, Identifiable{
    var id : Int
    var name : String
    var gamesCount : Int
    var image : String
    var backgroundImage : String
    var games : [DeveloperGameList]
    var positions : [Position]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gamesCount = "games_count"
        case image
        case backgroundImage = "image_background"
        case games
        case positions
    }
}
