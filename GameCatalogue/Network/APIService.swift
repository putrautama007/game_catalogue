//
//  APIService.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

fileprivate let gameUrl = "https://api.rawg.io/api/games?page=1"

class APIService : ServiceProtocol {
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
           loadGameData(completion)
    }
    
    private func loadGameData(_ completion: @escaping ([Game]?) -> Void){
        guard let url = URL(string: gameUrl) else {return}
        URLSession.shared.dataTask(with: url){ (data, urlResponse, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let games = try? JSONDecoder().decode(GameList.self, from: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(games.results)
            }
        }.resume()
    }
}
