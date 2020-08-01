//
//  GameDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct GameDetailView: View {
    var gameId : String
    var backgroundImage : String
    @ObservedObject var gameDetailViewModel = GameDetailViewModel()
    var body: some View {
        VStack(alignment: .center){
            if gameDetailViewModel.loading {
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
        }.navigationBarTitle(Text(gameDetailViewModel.gameDetail.name),displayMode: .inline)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: "4398",backgroundImage: "")
    }
}
