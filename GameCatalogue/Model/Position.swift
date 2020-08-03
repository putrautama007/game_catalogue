//
//  Position.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct Position: Codable,Identifiable {
    var id : Int
    var name : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
