//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 14/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @ObservedObject var gameViewModel =  GameViewModel()
    var body: some View {
        TabView {
            NavigationView {
                VStack(alignment: .center) {
                    if gameViewModel.loading {
                        LoadingIndicator(color: Color.blue, size: 50)
                    } else {
                        if (gameViewModel.games.results.count > 0) {
                            List(gameViewModel.games.results) { game in
                                NavigationLink(destination: GameDetailView()){
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
            } .tabItem {
                Image(systemName: "keyboard")
                Text("Games")
            }
            NavigationView {
                ProfileView()
            }.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
