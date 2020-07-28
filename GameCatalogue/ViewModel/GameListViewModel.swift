//
//  GameViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Combine

class GameListViewModel: ObservableObject {
    @Published var games =  GameList(count: 0, next: "", results: [])
    @Published var loading = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadGameData(){
        self.loading = true
        service.fetchGame{games in
            self.loading = false
            guard let games = games else{
                return
            }
            self.games.results = games
        }
    }
}
