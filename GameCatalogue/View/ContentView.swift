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
        TabView {
            NavigationView {
                GameListView()
            } .tabItem {
                Image(systemName: "keyboard")
                Text("Games")
            }
            NavigationView {
                DeveloperListView()
            } .tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Developer")
            }
            NavigationView {
                CreatorListView()
            } .tabItem {
                Image(systemName: "person.2.fill")
                Text("Creator")
            }
            NavigationView {
                ProfileView()
            }.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
