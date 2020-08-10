//
//  CreatorListView.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import SwiftUI

struct CreatorListView: View {
    @ObservedObject var creatorViewModel =  CreatorListViewModel()
    var body: some View {
        VStack(alignment: .center) {
            if creatorViewModel.loading {
                LoadingIndicator(color: Color.blue, size: 50)
            } else {
                if (creatorViewModel.creators.results.count > 0) {
                    List(creatorViewModel.creators.results) { creators in
                        NavigationLink(destination: CreatorDetailView(creator: creators)){
                            CreatorRowView(creator: creators)
                        }
                    }
                } else {
                    ErrorView(text: "Creator")
                }
            }
        }
        .onAppear {
            self.creatorViewModel.loadCreatorData()
        }
    }
}

struct CreatorListView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorListView()
    }
}
