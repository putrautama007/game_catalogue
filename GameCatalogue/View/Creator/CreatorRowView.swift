//
//  CreatorRowView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI
import URLImage

struct CreatorRowView: View {
    var creator : Creator
    var body: some View {
        HStack(alignment: .center) {
            URLImage(URL(string:  "\(creator.backgroundImage)")!, delay: 0.25) { proxy in
                proxy.image.resizable()
                    .frame(width: 100, height: 120).cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(creator.name)
                        .foregroundColor(.blue)
                        .lineLimit(2)
                        .font(Font.system(size:22))
                        .padding(.top,16)
                    
                }
                
                HStack {
                    Image("playtime")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                    Text("\(creator.gamesCount)")
                        .foregroundColor(.green)
                        .lineLimit(nil)
                }
            }
        }
        .cornerRadius(10)
        .frame(height: 130)
    }
}

//struct CreatorRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorRowView()
//    }
//}
