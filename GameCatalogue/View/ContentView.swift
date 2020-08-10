//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 14/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView{
            TabView {
                GameListView()
                    .tabItem {
                        Image(systemName: "keyboard")
                        Text("Games")
                }
                DeveloperListView()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Developer")
                }
                
                CreatorListView()
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Creator")
                }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                }
                
            }.navigationBarTitle(Text("Games Catalogue"),displayMode: .inline)
        }
    }
}
