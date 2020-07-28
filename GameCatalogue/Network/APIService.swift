//
//  APIService.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

fileprivate let baseUrl = "https://api.rawg.io/api/games"

class APIService : ServiceProtocol {
    func fetchGameById(gameId: String, completion: @escaping (GameDetail?) -> Void) {
        loadGameDataById(gameId: gameId, completion)
    }
    
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
           loadGameData(completion)
    }
    
    
    private func loadGameData(_ completion: @escaping ([Game]?) -> Void){
        guard let url = URL(string: "\(baseUrl)?page=1") else {return}
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
    
    private func loadGameDataById(gameId : String,_ completion: @escaping (GameDetail?) -> Void){
        guard let url = URL(string: "\(baseUrl)/\(gameId)") else {return}
        URLSession.shared.dataTask(with: url){ (data, urlResponse, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let games = try? JSONDecoder().decode(GameDetail.self, from: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(games)
            }
        }.resume()
    }
}
