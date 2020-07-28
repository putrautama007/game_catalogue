//
//  GameDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct GameDetailView: View {
    var gameId : String
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Image("mail")
                    .resizable()
                    .frame(height: 250.0)
                VStack{
                    Text("Game Name")
                        .foregroundColor(.blue)
                        .bold()
                        .lineLimit(2)
                        .font(Font.system(size:30))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                    
                    HStack{
                        Image("rating")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("4.69")
                            .font(Font.system(size:16))
                            .foregroundColor(Color.green)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                        
                        Image("calendar")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("27-10-2020")
                            .font(Font.system(size:16))
                            .foregroundColor(.blue)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                        Image("playtime")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("78 Hours")
                            .font(Font.system(size:16))
                            .foregroundColor(.green)
                            .lineLimit(nil)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                        Image("metacritic")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        
                        Text("88")
                            .foregroundColor(.blue)
                            .lineLimit(nil)
                            .font(Font.system(size:16))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                        
                    }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                }.background(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
                VStack(alignment: .leading){
                    Text("Game Description")
                        .foregroundColor(.blue)
                        .bold()
                        .lineLimit(2)
                        .font(Font.system(size:20))
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                    Text("/r/GrandTheftAutoV - the subreddit for all GTA V related news, content, and discussions revolving around Rockstar's critically acclaimed single player release and the ongoing multiplayer expansion of Grand Theft Auto Online.")
                        .multilineTextAlignment(.leading)
                        .font(Font.system(size:18))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }.background(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
                
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
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                        VStack(alignment: .center){
                            Text("Owned")
                                .bold()
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                        VStack(alignment: .center){
                            Text("Beaten")
                                .bold()
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                        VStack(alignment: .center){
                            Text("Toplay")
                                .bold()
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                        VStack(alignment: .center){
                            Text("Dropped")
                                .bold()
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                        VStack(alignment: .center){
                            Text("Playing")
                                .bold()
                                .font(Font.system(size:18))
                            Text("777")
                                .foregroundColor(.green)
                                .bold()
                                .font(Font.system(size:18))
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,  alignment: .center)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                }.background(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView(gameId: "4398")
    }
}
