//
//  GameViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Combine
import Foundation

class GameListViewModel: ObservableObject {
    @Published var games =  GameList(results: [])
    @Published var loading = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadGameData(){
        self.loading = true
        service.fetchGame{games in
            
            guard let games = games else{
                return
            }
            
            DispatchQueue.main.async {
                self.loading = false
                self.games.results = games
            }
            
        }
    }
}
