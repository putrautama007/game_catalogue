//
//  AddByStatus.swift
//  GameCatalogue
//
//  Created by Putra Utama on 28/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//


struct AddByStatus: Codable {
    let yet: Int
    let owned: Int
    let beaten: Int
    let toplay: Int
    let dropped: Int
    let playing: Int
}
