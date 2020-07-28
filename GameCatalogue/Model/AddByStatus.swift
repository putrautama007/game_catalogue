//
//  AddByStatus.swift
//  GameCatalogue
//
//  Created by Putra Utama on 28/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct AddByStatus: Codable {
    var yet: Int
    var owned: Int
    var beaten: Int
    var toplay: Int
    var dropped: Int
    var playing: Int
    
    enum CodingKeys: String, CodingKey {
        case yet
        case owned
        case beaten
        case toplay
        case dropped
        case playing
    }
}
