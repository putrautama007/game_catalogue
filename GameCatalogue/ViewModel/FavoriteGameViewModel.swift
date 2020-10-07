//
//  FavoriteGameViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

class FavoriteGameViewModel {
    var favoriteGame: FavoriteGame
    
    init(favoriteGame: FavoriteGame) {
        self.favoriteGame = favoriteGame
    }
    
    var gameBackgroundImage: String {
        self.favoriteGame.gameBackgroundImage ?? ""
    }
    
    var gameBackgroundImageAdditional: String {
        self.favoriteGame.gameBackgroundImageAdditional ?? ""
    }
    
    var gameId: Int32 {
        self.favoriteGame.gameId
    }
    
    var gameMetacritic: Int32 {
        self.favoriteGame.gameMetacritic
    }
    
    var gameName: String {
        self.favoriteGame.gameName ?? ""
    }
    
    var gamePlaytime: Int32 {
        self.favoriteGame.gamePlaytime
    }
    
    var gameRating: Float {
        self.favoriteGame.gameRating
    }
    
    var gameRelease: String {
        self.favoriteGame.gameRelease ?? ""
    }
    
    var gameDescription: String {
        self.favoriteGame.gameDescription ?? ""
    }
    
}
