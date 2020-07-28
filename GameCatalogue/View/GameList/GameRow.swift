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
        HStack(alignment: .center) {
            URLImage(URL(string:  "\(game.backgroundImage)")!, delay: 0.25) { proxy in
                proxy.image.resizable()
                    .frame(width: 100, height: 120).cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(game.name)
                        .foregroundColor(.blue)
                        .lineLimit(2)
                        .font(Font.system(size:22))
                        .padding(.top,16)
                    
                }
                HStack(alignment: .center) {
                    Image("rating")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text(game.rating.format())
                        .foregroundColor(Color.green)
                    
                    Image("calendar")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text(game.released).foregroundColor(.blue)
                }
                
                HStack {
                    Image("playtime")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text("\(game.playtime) Hours")
                        .foregroundColor(.green)
                        .lineLimit(nil)
                    
                    Image("metacritic")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    
                    Text("\(game.metacritic)")
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                }
            }
        }
        .cornerRadius(10)
        .frame(height: 130)
    }
}
