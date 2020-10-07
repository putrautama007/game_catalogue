//
//  DeveloperList.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct DeveloperList: Codable {
    var count : Int
    var next : String
    var results : [Developer]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
}
