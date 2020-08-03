//
//  ErrorView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    var text : String
    var body: some View {
        VStack{
            Image("no_data")
                .resizable()
                .frame(width: 400, height: 450.0)
                .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 0))
            
            Text("No \(text) Data or Error")
                .foregroundColor(.blue)
                .lineLimit(2)
                .font(Font.system(size:26 , weight: .heavy))
                .padding(.top,16)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(text:"Games")
    }
}

