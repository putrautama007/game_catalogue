//
//  GameDetail.swift
//  GameCatalogue
//
//  Created by Putra Utama on 28/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameDetail: Codable, Identifiable{
    var id : Int
    var name : String
    var released : String
    var backGroundImage : String
    var rating : Float
    var playtime : Int
    var metacritic : Int
    var addByStatus : AddByStatus
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backGroundImage = "background_image"
        case rating
        case playtime
        case metacritic
        case addByStatus = "added_by_status"
        case description = "reddit_description"
    }
}
