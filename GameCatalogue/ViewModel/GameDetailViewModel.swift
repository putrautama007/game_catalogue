//
//  GameDetailViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 28/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Combine

class GameDetailViewModel: ObservableObject {
    @Published var gameDetail = GameDetail(id: 0, name: "", released: "", backGroundImage: "", rating: 0, playtime: 0, metacritic: 0, addByStatus: AddByStatus(yet: 0,owned: 0,beaten: 0, toplay: 0,dropped: 0, playing : 0), description: "")
    @Published var loading : Bool = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadGameDataById(id : String){
        self.loading = true
        service.fetchGameById(gameId: id){gameDetail in
            self.loading = false
            guard let gameDetail = gameDetail else{
                return
            }
            self.gameDetail = gameDetail
        }
    }
}
