//
//  DeveloperRowVIew.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct DeveloperRowVIew: View {
    var developer : Developer
    var body: some View {
        HStack(alignment: .center) {
            URLImage(URL(string:  "\(developer.backgroundImage)")!, delay: 0.25) { proxy in
                proxy.image.resizable()
                    .frame(width: 100, height: 120).cornerRadius(10)
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
    }
}

//struct DeveloperRowVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        DeveloperRowVIew()
//    }
//}
