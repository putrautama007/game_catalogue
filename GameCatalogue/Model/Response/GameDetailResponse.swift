//
//  GameDetailResponse.swift
//  GameCatalogue
//
//  Created by Putra Utama on 13/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

struct GameDetailResponse: Codable {
    let id : Int?
    let name : String?
    let released : String?
    let backgroundImage : String?
    let backgroundImageAdditional : String?
    let rating : Float?
    let playtime : Int?
    let metacritic : Int?
    let addByStatus : AddByStatusResponse?
    let description : String?
    let publishers : [GamePublisherResponse]?
    let genres : [GameGenreResponse]?
    let tags : [GameTagResponse]?
    
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
    
    struct AddByStatusResponse: Codable {
        let yet: Int?
        let owned: Int?
        let beaten: Int?
        let toplay: Int?
        let dropped: Int?
        let playing: Int?
        
        enum CodingKeys: String, CodingKey {
            case yet
            case owned
            case beaten
            case toplay
            case dropped
            case playing
        }
    }
    
    struct GamePublisherResponse : Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
    
    struct GameGenreResponse : Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
    
    struct GameTagResponse : Codable {
        let id : Int?
        let name : String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
        }
    }
}
