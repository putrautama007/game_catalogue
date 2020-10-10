//
//  RemoteImage.swift
//  GameCatalogue
//
//  Created by Putra Utama on 10/10/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation
import UIKit

class RemoteImage: ObservableObject {
    @Published var isValid = false
    @Published var loadDone = false
    var data:Data?
    var url: String = ""

    func setUrl(urlString:String) {
        self.url = urlString
    }

    func getRemoteImage() {
        guard let url = URL(string: self.url) else {
            isValid = false
            loadDone = true
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.loadDone = true
                self.isValid = true
                self.data = data
            }
        }
        task.resume()

    }

    func imageFromRemote() -> UIImage {
        guard let data = data else { return UIImage()}
        return UIImage(data: data) ?? UIImage()
    }
}
