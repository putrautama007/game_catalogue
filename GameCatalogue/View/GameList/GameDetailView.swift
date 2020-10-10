//
//  GameDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct GameDetailView: View {
    @State var isSaved = true
    var gameId : String
    var backgroundImage : String
    var isImageAvailable : Bool
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    @ObservedObject var addFavoriteGameViewModel = AddFavoriteGameViewModel()
    @ObservedObject var deleteFavoriteGameViewModel = DeleteFavoriteGameViewModel()
    @ObservedObject var loadFavoriteGameByIdViewModel = LoadFavoriteGameByIdViewModel()
    @ObservedObject var remoteImage : RemoteImage = RemoteImage()
    
    init(gameId : String, backgroundImage : String) {
        self.gameId = gameId
        self.backgroundImage = backgroundImage
        isImageAvailable = backgroundImage == "Unavailable!" ? false : true
    }
    
    var body: some View {
        VStack(alignment: .center){
            if gameDetailViewModel.loading {
                VStack(alignment: .center){
                    LoadingIndicator(color: Color.blue, size: 50)
                }
            }else{
                List{
                    VStack(alignment: .leading){
                        if isImageAvailable {
                            if remoteImage.loadDone {
                                if remoteImage.isValid {
                                    Image(uiImage: remoteImage.imageFromRemote())
                                        .resizable()
                                        .frame(height: 250.0)
                                } else {
                                    Image(systemName: "exclamtionmark.square.fill")
                                        .resizable()
                                        .foregroundColor(.red)
                                        .frame(height: 250.0)
                                }
                            } else {
                                LoadingIndicator(color: Color.blue, size: 50)
                                    .frame(width: UIScreen.main.bounds.size.width, height: 250.0, alignment: .center)
                            }
                        } else {
                            Image(systemName: "exclamtionmark.square.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(height: 250.0)
                        }
                        VStack{
                            Text(gameDetailViewModel.gameDetail.name)
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
                                Text("\(gameDetailViewModel.gameDetail.rating.format())")
                                    .font(Font.system(size:16))
                                    .foregroundColor(Color.green)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                
                                Image("calendar")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                Text("\(gameDetailViewModel.gameDetail.released)")
                                    .font(Font.system(size:16))
                                    .foregroundColor(.blue)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                Image("playtime")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                Text("\(gameDetailViewModel.gameDetail.playtime) Hours")
                                    .font(Font.system(size:16))
                                    .foregroundColor(.green)
                                    .lineLimit(nil)
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                                
                                Image("metacritic")
                                    .resizable()
                                    .frame(width: 24.0, height: 24.0)
                                    .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                                
                                Text("\(gameDetailViewModel.gameDetail.metacritic)")
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
                            Text("\(gameDetailViewModel.gameDetail.description.replacingOccurrences(of: "\r\n", with:"" ))")
                                .multilineTextAlignment(.leading)
                                .font(Font.system(size:18))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        }
                        
                        VStack(alignment: .leading){
                            Text("Status")
                                .foregroundColor(.blue)
                                .bold()
                                .lineLimit(2)
                                .font(Font.system(size:20))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                            
                            HStack{
                                VStack(alignment: .center){
                                    Text("Yet")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.yet)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                                VStack(alignment: .center){
                                    Text("Owned")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.owned)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                                VStack(alignment: .center){
                                    Text("Beaten")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.beaten)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                                VStack(alignment: .center){
                                    Text("Toplay")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.toplay)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                                VStack(alignment: .center){
                                    Text("Dropped")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.dropped)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                                VStack(alignment: .center){
                                    Text("Playing")
                                        .bold()
                                        .font(Font.system(size:16))
                                    Text("\(gameDetailViewModel.gameDetail.addByStatus.playing)")
                                        .foregroundColor(.green)
                                        .bold()
                                        .font(Font.system(size:16))
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            
                        }
                        
                        Text("Genres")
                            .foregroundColor(.blue)
                            .bold()
                            .lineLimit(2)
                            .font(Font.system(size:20))
                            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        
                        VStack(alignment: .leading){
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 10){
                                    ForEach(gameDetailViewModel.gameDetail.genres) { tag in
                                        Text("\(tag.name)")
                                            .foregroundColor(.green)
                                            .bold()
                                            .font(Font.system(size:16))
                                            .lineLimit(nil)
                                            .padding(4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                } .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .frame(height: 30)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        
                        
                        
                        Text("Tags")
                            .foregroundColor(.blue)
                            .bold()
                            .lineLimit(2)
                            .font(Font.system(size:20))
                            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        
                        VStack(alignment: .leading){
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 10){
                                    ForEach(gameDetailViewModel.gameDetail.tags) { tag in
                                        Text("\(tag.name)")
                                            .foregroundColor(.green)
                                            .bold()
                                            .font(Font.system(size:16))
                                            .lineLimit(nil)
                                            .padding(4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                } .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .frame(height: 30)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        
                        Text("Publishers")
                            .foregroundColor(.blue)
                            .bold()
                            .lineLimit(2)
                            .font(Font.system(size:20))
                            .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                        
                        VStack(alignment: .leading){
                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack(spacing: 10){
                                    ForEach(gameDetailViewModel.gameDetail.publishers) { publisher in
                                        Text("\(publisher.name)")
                                            .foregroundColor(.green)
                                            .bold()
                                            .font(Font.system(size:16))
                                            .lineLimit(nil)
                                            .padding(4)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .stroke(Color.black, lineWidth: 2)
                                            )
                                    }
                                } .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .frame(height: 30)
                            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                        }
                    }
                }
                .padding(.leading, -20)
                .padding(.trailing, -20)
                
            }
        }.onAppear {
            self.gameDetailViewModel.loadGameDataById(id: self.gameId)
            self.loadFavoriteGameByIdViewModel.fetchFavoriteGameById(gameId: Int32(self.gameId)!)
            self.remoteImage.setUrl(urlString: self.backgroundImage)
            if self.isImageAvailable{
                self.remoteImage.getRemoteImage()
            }
            
        }.navigationBarTitle(Text(gameDetailViewModel.gameDetail.name),displayMode: .inline)
        .navigationBarItems(trailing: self.loadFavoriteGameByIdViewModel.favoriteGame.gameId == 0 || self.isSaved == false ?
                                Button(action:{
                                    self.addFavoriteGameViewModel.gameBackgroundImage = self.gameDetailViewModel.gameDetail.backgroundImage
                                    self.addFavoriteGameViewModel.gameBackgroundImageAdditional = self.gameDetailViewModel.gameDetail.backgroundImageAdditional
                                    self.addFavoriteGameViewModel.gameRating = self.gameDetailViewModel.gameDetail.rating
                                    self.addFavoriteGameViewModel.gameId = Int32(self.gameDetailViewModel.gameDetail.id)
                                    self.addFavoriteGameViewModel.gameName = self.gameDetailViewModel.gameDetail.name
                                    self.addFavoriteGameViewModel.gameMetacritic = Int32(self.gameDetailViewModel.gameDetail.metacritic)
                                    self.addFavoriteGameViewModel.gameRelease = self.gameDetailViewModel.gameDetail.released
                                    self.addFavoriteGameViewModel.gamePlaytime = Int32(self.gameDetailViewModel.gameDetail.playtime)
                                    self.addFavoriteGameViewModel.gameDescription = self.gameDetailViewModel.gameDetail.description
                                    
                                    let saved = self.addFavoriteGameViewModel.addFavoriteGame()
                                    if(saved){
                                        self.isSaved = saved
                                    }
                                    self.loadFavoriteGameByIdViewModel.fetchFavoriteGameById(gameId: Int32(self.gameId)!)
                                }){
                                    Image(systemName:"bookmark")
                                }
            : Button(action:{
                self.deleteFavoriteGameViewModel.gameId = Int32(self.gameDetailViewModel.gameDetail.id)
                
                let removed = self.deleteFavoriteGameViewModel.deleteFavoriteGame()
                if(removed == true){
                    self.isSaved = false
                }else{
                    self.isSaved = true
                }
                self.loadFavoriteGameByIdViewModel.fetchFavoriteGameById(gameId: Int32(self.gameId)!)
            }){
                Image(systemName:"bookmark.fill")
            }
        )
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: "4398",backgroundImage: "")
    }
}
