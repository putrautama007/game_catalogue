//
//  DeveloperListViewModel.swift
//  GameCatalogue
//
//  Created by Putra Utama on 03/08/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Combine

class DeveloperListViewModel: ObservableObject {
    @Published var developer = DeveloperList(results: [])
    @Published var loading: Bool = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadDeveloperData(){
        self.loading = true
        service.fetchDeveloper{developer in
            self.loading = false
            guard let developer = developer else{
                return
            }
            self.developer.results = developer
        }
    }
}
