//
//  LoadFavoriteGameByIdViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

class LoadFavoriteGameByIdViewModel: ObservableObject {
    
    @Published
    var favoriteGame = FavoriteGameModel(gameId: 0, gameName: "", gameRelease: "", gameBackgroundImage: "", gameBackgroundImageAdditional: "", gameRating: 0.0, gamePlaytime: 0, gameMetacritic: 0,gameDescription: "")
    @Published var loading : Bool = false
    
    
    func fetchFavoriteGameById(gameId: Int32) {
        self.loading = true
        CoreDataManagers.shared.getFavoriteGameById(gameId){
            favoriteGame in
            self.loading = false
            guard let favoriteGame = favoriteGame else{
                return
            }
            self.favoriteGame = favoriteGame

        }
    }
}
