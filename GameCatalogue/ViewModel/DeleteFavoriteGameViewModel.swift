//
//  DeleteFavoriteGameViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation
class DeleteFavoriteGameViewModel: ObservableObject {
    var gameId: Int32 = 0
    
    func deleteFavoriteGame() -> Bool {
        do {
            try CoreDataManagers.shared.deleteFavoriteGame(gameId: gameId)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}
