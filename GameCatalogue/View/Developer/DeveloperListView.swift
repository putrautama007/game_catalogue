//
//  DeveloperListView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct DeveloperListView: View {
    @ObservedObject var developerViewModel =  DeveloperListViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if developerViewModel.loading {
                LoadingIndicator(color: Color.blue, size: 50)
            } else {
                if (developerViewModel.developer.results.count > 0) {
                    List(developerViewModel.developer.results) { developer in
                        NavigationLink(destination: DeveloperDetailView(developer: developer)){
                            DeveloperRowVIew(developer:developer)
                        }
                    }
                } else {
                    ErrorView(text: "Developer")
                }
            }
        }
        .onAppear {
            self.developerViewModel.loadDeveloperData()
        }
    }
}

struct DeveloperListView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperListView()
    }
}
