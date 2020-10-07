//
//  FavoriteGameListView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 06/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct FavoriteGameListView: View {
    @ObservedObject private var favoriteGameListViewModel = LoadFavoriteGameListViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if favoriteGameListViewModel.loading {
                LoadingIndicator(color: Color.blue, size: 50)
            } else {
                if (favoriteGameListViewModel.favoriteGame.count > 0) {
                    List(favoriteGameListViewModel.favoriteGame, id: \.gameId) { favoriteGame in
                        NavigationLink(destination: FavoriteGameDetailView(gameId: "\(favoriteGame.gameId)",backgroundImage: "\(favoriteGame.gameBackgroundImage)")){
                           FavoriteGameRow(game: favoriteGame)
                        }
                    }
                } else {
                    ErrorView(text: "Games")
                }
            }
        }
        .onAppear {
            self.favoriteGameListViewModel.fetchAllFavoriteGame()
        }
    }
}

struct FavoriteGameListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGameListView()
    }
}
