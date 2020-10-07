//
//  Game.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct Game: Codable, Identifiable {
    var id: Int
    var name: String
    var released: String
    var backgroundImage: String
    var rating: Float
    var playtime: Int
    var metacritic: Int
    
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
