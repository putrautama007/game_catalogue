//
//  CreatorDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct CreatorDetailView: View {
    var creator : Creator
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                URLImage(URL(string:  "\(creator.backgroundImage)")!) { proxy in
                    proxy.image.resizable()
                        .frame(height: 250.0)
                }
                VStack{
                    HStack{
                        URLImage(URL(string:  "\(creator.image)")!) { proxy in
                            proxy.image.resizable()
                                .frame(width: 64.0, height: 64.0)
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
                        }
                        
                        VStack{
                            Text(creator.name)
                                .foregroundColor(.blue)
                                .bold()
                                .lineLimit(2)
                                .font(Font.system(size:24))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 16))
                            
                            Text(creator.positions[0].name)
                                .foregroundColor(.blue)
                                .lineLimit(2)
                                .font(Font.system(size:18))
                                .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                                .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 16))
                        }
                    }
                    
                    HStack{
                        
                        Image("playtime")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("\(creator.gamesCount)")
                            .font(Font.system(size:16))
                            .foregroundColor(.green)
                            .lineLimit(nil)
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 4))
                        
                        
                    }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                }
                
                Text("Games")
                    .foregroundColor(.blue)
                    .bold()
                    .lineLimit(2)
                    .font(Font.system(size:20))
                    .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                
                ForEach(creator.games) { tag in
                    VStack(spacing: 10){
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
                        
                    } .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                    
                }
            }
        }
        .navigationBarTitle(Text(creator.name),displayMode: .inline)
    }
}

//struct CreatorDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorDetailView()
//    }
//}
