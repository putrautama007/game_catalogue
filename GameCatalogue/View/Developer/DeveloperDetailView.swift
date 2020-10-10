//
//  DeveloperDetailView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct DeveloperDetailView: View {
    var developer : Developer
    var isImageAvailable : Bool
    @ObservedObject var remoteImage : RemoteImage = RemoteImage()
    
    init(developer : Developer) {
        self.developer = developer
        isImageAvailable = developer.backgroundImage == "Unavailable!" ? false : true
    }
    
    var body: some View {
        ScrollView{
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
                    Text(developer.name)
                        .foregroundColor(.blue)
                        .bold()
                        .lineLimit(2)
                        .font(Font.system(size:24))
                        .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                    
                    HStack{
                        
                        Image("playtime")
                            .resizable()
                            .frame(width: 24.0, height: 24.0)
                            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
                        Text("\(developer.gamesCount)")
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
                
                ForEach(developer.games) { tag in
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
            .onAppear(){
                self.remoteImage.setUrl(urlString: developer.backgroundImage)
                if self.isImageAvailable{
                    self.remoteImage.getRemoteImage()
                }
            }
        }
        .navigationBarTitle(Text(developer.name),displayMode: .inline)
        
        
    }
}
