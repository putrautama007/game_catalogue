//
//  ProfileView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 14/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image("profile")
                       .resizable()
                       .frame(width: 150.0, height: 150.0)
                       .clipShape(Circle())
                       .overlay(Circle().stroke(Color.white, lineWidth: 4))
                       .shadow(radius: 10)
            
            Text("Nyoman Putra Utama").font(.title).padding(.top,16)
            Text("putrautama30@gmail.com").font(.subheadline).padding(.top,16)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
