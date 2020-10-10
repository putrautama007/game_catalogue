//
//  FavoriteGameView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 07/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct FavoriteGameRow: View {
    var game : FavoriteGameViewModel
    var isImageAvailable : Bool
    @ObservedObject var remoteImage : RemoteImage = RemoteImage()
    
    init(game : FavoriteGameViewModel) {
        self.game = game
        isImageAvailable = game.favoriteGame.gameBackgroundImage == "Unavailable!" ? false : true
    }
    
    var body: some View {
        HStack(alignment: .center) {
            if isImageAvailable {
                if remoteImage.loadDone {
                    if remoteImage.isValid {
                        Image(uiImage: remoteImage.imageFromRemote())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 120).cornerRadius(10)
                    } else {
                        Image(systemName: "exclamtionmark.square.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 100, height: 120)
                            .cornerRadius(10)
                    }
                } else {
                    LoadingIndicator(color: Color.blue, size: 25)
                        .frame(width: 100, height: 120)
                }
            } else {
                Image(systemName: "exclamtionmark.square.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 120)
                    .cornerRadius(10)
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
        .onAppear(){
            self.remoteImage.setUrl(urlString: game.favoriteGame.gameBackgroundImage ?? "")
            if self.isImageAvailable{
                self.remoteImage.getRemoteImage()
            }
        }
    }
}
