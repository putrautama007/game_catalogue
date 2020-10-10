//
//  DeveloperRowVIew.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct DeveloperRowVIew: View {
    var developer : Developer
    var isImageAvailable : Bool
    @ObservedObject var remoteImage : RemoteImage = RemoteImage()
    
    init(developer : Developer) {
        self.developer = developer
        isImageAvailable = developer.backgroundImage == "Unavailable!" ? false : true
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
                Text(developer.name)
                    .foregroundColor(.blue)
                    .lineLimit(2)
                    .font(Font.system(size:22))
                    .padding(.top,16)
                
                HStack {
                    Image("playtime")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text("\(developer.gamesCount)")
                        .foregroundColor(.green)
                        .lineLimit(nil)
                }
            }
        }
        .cornerRadius(10)
        .frame(height: 130)
        .onAppear(){
            self.remoteImage.setUrl(urlString: developer.backgroundImage)
            if self.isImageAvailable{
                self.remoteImage.getRemoteImage()
            }
        }
    }
}
