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
    var backgroundImage : String
    var backgroundImageAdditional : String
    var rating : Float
    var playtime : Int
    var metacritic : Int
    var addByStatus : AddByStatus
    var description : String
    var publishers : [GamePublisher]
    var genres : [GameGenre]
    var tags : [GameTag]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case rating
        case playtime
        case metacritic
        case addByStatus = "added_by_status"
        case description = "description_raw"
        case publishers
        case genres
        case tags
    }
}
