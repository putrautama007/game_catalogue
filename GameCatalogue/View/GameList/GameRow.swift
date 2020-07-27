//
//  GameRow.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct GameRow: View {
    var game : Game
    var body: some View {
        HStack {
            URLImage(URL(string:  "\(game.backGroundImage)")!, delay: 0.25) { proxy in
                proxy.image.resizable()
                    .frame(width: 90, height: 120)

            }
            
            VStack {
                Spacer()
                HStack {
                    Text(game.name)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text(game.released).foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(game.rating.format())")
                }
                HStack {
                    Text("Play Time: \(game.playtime)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Metacritic: \(game.metacritic)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}
