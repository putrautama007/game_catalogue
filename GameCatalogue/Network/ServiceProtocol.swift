//
//  ServiceProtocol.swift
//  GameCatalogue
//
//  Created by Putra Utama on 27/07/20.
//  Copyright © 2020 Putra Utama. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetchGame(completion: @escaping ([Game]?) -> Void)
}
