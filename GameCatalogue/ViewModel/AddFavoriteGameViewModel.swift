//
//  AddFavoriteGameViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

class AddFavoriteGameViewModel: ObservableObject {
    var gameBackgroundImage: String = ""
    var gameBackgroundImageAdditional: String = ""
    var gameId: Int32 = 0
    var gameMetacritic: Int32  = 0
    var gameName: String = ""
    var gamePlaytime: Int32 = 0
    var gameRating: Float = 0.0
    var gameRelease: String = ""
    var gameDescription: String = ""
    
    private var favoriteGame: FavoriteGame {
        let favoriteGame = FavoriteGame(context: CoreDataManagers.shared.managedObjectContext)
        favoriteGame.gameBackgroundImage = gameBackgroundImage
        favoriteGame.gameBackgroundImageAdditional = gameBackgroundImageAdditional
        favoriteGame.gameId = gameId
        favoriteGame.gameMetacritic = gameMetacritic
        favoriteGame.gameName = gameName
        favoriteGame.gamePlaytime = gamePlaytime
        favoriteGame.gameRating = gameRating
        favoriteGame.gameRelease = gameRelease
        favoriteGame.gameDescription = gameDescription
        return favoriteGame
    }
    
    func addFavoriteGame() -> Bool {
        do {
            try CoreDataManagers.shared.addFavortiteGame(favoriteGame: favoriteGame)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }

}
