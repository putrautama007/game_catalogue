//
//  CreatorList.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct CreatorList: Codable {
    var results : [Creator]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
