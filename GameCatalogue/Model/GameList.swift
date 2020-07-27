//
//  GameList.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameList: Codable{
    var count : Int
    var next : String
    var results : [Game]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}
