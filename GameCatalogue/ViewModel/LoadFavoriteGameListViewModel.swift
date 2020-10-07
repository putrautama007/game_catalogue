//
//  FavoriteGameListViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation
class LoadFavoriteGameListViewModel: ObservableObject {
    
    @Published
    var favoriteGame = [FavoriteGameViewModel]()
    @Published var loading : Bool = false
    
    init() {
        fetchAllFavoriteGame()
    }
    
    func fetchAllFavoriteGame() {
        self.loading = true
        DispatchQueue.main.async {
            self.loading = false
            self.favoriteGame = CoreDataManagers.shared.getAllFavoriteGame().map(FavoriteGameViewModel.init)
        }
    }
}
