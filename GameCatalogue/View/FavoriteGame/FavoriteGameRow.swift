//
//  FavoriteGameView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 07/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct FavoriteGameRow: View {
    var game : FavoriteGameViewModel
    var body: some View {
        HStack(alignment: .center) {
            URLImage(URL(string:  "\(game.gameBackgroundImage)")!, delay: 0.25) { proxy in
                proxy.image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 120).cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(game.gameName)
                        .foregroundColor(.blue)
                        .lineLimit(2)
                        .font(Font.system(size:22))
                        .padding(.top,16)
                    
                }
                HStack(alignment: .center) {
                    Image("rating")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text(game.gameRating.format())
                        .foregroundColor(Color.green)
                    
                    Image("calendar")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text(game.gameRelease).foregroundColor(.blue)
                }
                
                HStack {
                    Image("playtime")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text("\(game.gamePlaytime) Hours")
                        .foregroundColor(.green)
                        .lineLimit(nil)
                    
                    Image("metacritic")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    
                    Text("\(game.gameMetacritic)")
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                }
            }
        }
        .cornerRadius(10)
        .frame(height: 130)
    }
}
