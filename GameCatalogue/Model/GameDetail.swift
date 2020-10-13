//
//  GameDetail.swift
//  GameCatalogue
//
//  Created by Putra Utama on 28/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameDetail: Decodable, Identifiable{
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
}
