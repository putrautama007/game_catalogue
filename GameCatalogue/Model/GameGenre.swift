//
//  GameGenre.swift
//  GameCatalogue
//
//  Created by Putra Utama on 31/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameGenre : Codable,Identifiable {
    var id : Int
    var name : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
