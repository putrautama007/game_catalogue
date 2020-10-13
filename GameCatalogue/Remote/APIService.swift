//
//  APIService.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

fileprivate let baseUrl = "https://api.rawg.io/api/"

class APIService : ServiceProtocol {
    func fetchDeveloper(completion: @escaping ([Developer]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)developers?page=1&page_size=8") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let developer = try? JSONDecoder().decode(DeveloperList.self, from: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(developer.results)
            }
        }.resume()
    }
    
    func fetchCreator(completion: @escaping ([Creator]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)creators?page=1&page_size=8") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let creator = try? JSONDecoder().decode(CreatorList.self, from: data) else{
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(creator.results)
            }
        }.resume()
    }
    
    func fetchGameById(gameId: String, completion: @escaping (GameDetail?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games/\(gameId)") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let game = try? JSONDecoder().decode(GameDetailResponse.self, from: data) else{
                completion(nil)
                return
            }
            
            var publishers : [GamePublisher] = []
            game.publishers?.forEach({ (publisher) in
                publishers.append(GamePublisher(
                    id: publisher.id ?? 0,
                    name: publisher.name ?? ""
                ))
            })
            
            var tags : [GameTag] = []
            game.tags?.forEach({ (tag) in
                tags.append(GameTag(
                    id: tag.id ?? 0,
                    name: tag.name ?? ""
                ))
            })
            
            var genres : [GameGenre] = []
            game.genres?.forEach({ (genre) in
                genres.append(GameGenre(
                    id: genre.id ?? 0,
                    name: genre.name ?? ""
                ))
            })
            
            let addByStatus = AddByStatus(
                yet: game.addByStatus?.yet ?? 0,
                owned: game.addByStatus?.owned ?? 0,
                beaten: game.addByStatus?.beaten ?? 0,
                toplay: game.addByStatus?.toplay ?? 0,
                dropped: game.addByStatus?.dropped ?? 0,
                playing: game.addByStatus?.playing ?? 0
            )
            
            
            
            let gameDetail = GameDetail(
                id: game.id ?? 0,
                name: game.name ?? "",
                released : game.released ?? "",
                backgroundImage : game.backgroundImage ?? "Unavailable!",
                backgroundImageAdditional : game.backgroundImageAdditional ?? "Unavailable!",
                rating : game.rating ?? 0.0,
                playtime : game.playtime ?? 0,
                metacritic : game.metacritic ?? 0,
                addByStatus : addByStatus,
                description : game.description ?? "",
                publishers : publishers,
                genres : genres,
                tags : tags
                )
            
            DispatchQueue.main.async {
                completion(gameDetail)
            }
        }.resume()
    }
    
    func fetchGame(completion: @escaping ([Game]?) -> Void) {
        guard let url = URL(string: "\(baseUrl)games?page=1&page_size=10") else {return}
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            guard let game = try? JSONDecoder().decode(GameResponseList.self, from: data) else{
                completion(nil)
                return
            }
            
            var games : [Game] = []
            game.results?.forEach({ (result) in
                games.append(Game(
                    id: result.id ?? 0,
                    name: result.name ?? "",
                    released: result.released ?? "", backgroundImage: result.backgroundImage ?? "Unavailable!",
                    rating: result.rating ?? 0.0,
                    playtime: result.playtime ?? 0,
                    metacritic: result.metacritic ?? 0
                ))
            })
            
            DispatchQueue.main.async {
                completion(games)
            }
        }.resume()
    }
}
