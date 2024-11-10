//
//  MovieModel.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//

import Foundation

struct MovieModel: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let image: String
}
