//
//  CreatorListViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Combine

class CreatorListViewModel: ObservableObject {
    @Published var creators = CreatorList(count: 0, next: "", results: [])
    @Published var loading : Bool = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadCreatorData(){
        self.loading = true
        service.fetchCreator{creators in
            self.loading = false
            guard let creators = creators else{
                return
            }
            self.creators.results = creators
        }
    }
}
