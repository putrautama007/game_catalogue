//
//  GameListView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct GameListView: View {
     @ObservedObject var gameViewModel =  GameListViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if gameViewModel.loading {
                LoadingIndicator(color: Color.blue, size: 50)
            } else {
                if (gameViewModel.games.results.count > 0) {
                    List(gameViewModel.games.results) { game in
                        NavigationLink(destination: GameDetailView(gameId: "\(game.id)",backgroundImage: "\(game.backgroundImage)")){
                            GameRow(game: game)
                        }
                    }
                } else {
                    VStack(alignment: .center) {
                        Text("No Games or error")
                    }
                }
            }
        }
        .onAppear {
            self.gameViewModel.loadGameData()
        }
        .navigationBarTitle(Text("Games"))
    }
}

//struct GameListView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameListView()
//    }
//}