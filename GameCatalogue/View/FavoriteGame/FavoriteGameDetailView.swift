//
//  FavoriteGameDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 07/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct FavoriteGameDetailView: View {
    @State var isSaved = true
    var gameId : String
    var backgroundImage : String
    @ObservedObject var addFavoriteGameViewModel = AddFavoriteGameViewModel()
    @ObservedObject var deleteFavoriteGameViewModel = DeleteFavoriteGameViewModel()
    @ObservedObject var loadFavoriteGameByIdViewModel = LoadFavoriteGameByIdViewModel()
    var body: some View {
        VStack(alignment: .center){
            if loadFavoriteGameByIdViewModel.loading {
                VStack(alignment: .center){
                    LoadingIndicator(color: Color.blue, size: 50)
                }
            }else{
                List{
                    VStack(alignment: .leading){
                        URLImage(URL(string:  "\(self.backgroundImage)")!) { proxy in
                            proxy.image.resizable()
                                .frame(height: 250.0)
                        }
                        VStack{
                            Text(loadFavoriteGameByIdViewModel.favoriteGame.gameName!)
                                .foregroundColor(.blue)
                                .bold()
                                .lineLimit(2)
                                .font(Font.system(size:24))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                            
                            HStack{
                                Image("rating")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                Text("\(loadFavoriteGameByIdViewModel.favoriteGame.gameRating!.format())")
                                    .font(Font.system(size:16))
                                    .foregroundColor(Color.green)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                
                                Image("calendar")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                Text("\(loadFavoriteGameByIdViewModel.favoriteGame.gameRelease ?? "")")
                                    .font(Font.system(size:16))
                                    .foregroundColor(.blue)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                Image("playtime")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                Text("\(loadFavoriteGameByIdViewModel.favoriteGame.gamePlaytime ?? 0) Hours")
                                    .font(Font.system(size:16))
                                    .foregroundColor(.green)
                                    .lineLimit(nil)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                Image("metacritic")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                
                                Text("\(loadFavoriteGameByIdViewModel.favoriteGame.gameMetacritic ?? 0)")
                                    .foregroundColor(.blue)
                                    .lineLimit(nil)
                                    .font(Font.system(size:16))
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                
                            }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Game Description")
                                .foregroundColor(.blue)
                                .bold()
                                .lineLimit(2)
                                .font(Font.system(size:20))
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                            Text("\(loadFavoriteGameByIdViewModel.favoriteGame.gameDescription ?? "")")
                                .multilineTextAlignment(.leading)
                                .font(Font.system(size:18))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                }
                .padding(.leading, -20)
                .padding(.trailing, -20)
                
            }
        }.onAppear {
            self.loadFavoriteGameByIdViewModel.fetchFavoriteGameById(gameId: Int32(self.gameId)!)

        }.navigationBarTitle(Text(loadFavoriteGameByIdViewModel.favoriteGame.gameName!),displayMode: .inline)
            .navigationBarItems(trailing: self.isSaved == false ?
                Button(action:{
                    self.addFavoriteGameViewModel.gameBackgroundImage = self.loadFavoriteGameByIdViewModel.favoriteGame.gameBackgroundImage!
                    self.addFavoriteGameViewModel.gameBackgroundImageAdditional = self.loadFavoriteGameByIdViewModel.favoriteGame.gameBackgroundImageAdditional!
                    self.addFavoriteGameViewModel.gameRating = self.loadFavoriteGameByIdViewModel.favoriteGame.gameRating!
                    self.addFavoriteGameViewModel.gameId = self.loadFavoriteGameByIdViewModel.favoriteGame.gameId!
                    self.addFavoriteGameViewModel.gameName = self.loadFavoriteGameByIdViewModel.favoriteGame.gameName!
                    self.addFavoriteGameViewModel.gameMetacritic = self.loadFavoriteGameByIdViewModel.favoriteGame.gameMetacritic!
                    self.addFavoriteGameViewModel.gameRelease = self.loadFavoriteGameByIdViewModel.favoriteGame.gameRelease!
                    self.addFavoriteGameViewModel.gamePlaytime = self.loadFavoriteGameByIdViewModel.favoriteGame.gamePlaytime!
                    
                    let saved = self.addFavoriteGameViewModel.addFavoriteGame()
                    if(saved){
                        self.isSaved = saved
                    }
                }){
                    Image(systemName:"bookmark")
                }
                : Button(action:{
                    self.deleteFavoriteGameViewModel.gameId = self.loadFavoriteGameByIdViewModel.favoriteGame.gameId!
                    
                    let removed = self.deleteFavoriteGameViewModel.deleteFavoriteGame()
                    if(removed == true){
                        self.isSaved = false
                    }else{
                         self.isSaved = true
                    }
                }){
                    Image(systemName:"bookmark.fill")
                }
        )
    }
}
