//
//  CartManager.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//
import Foundation
import SwiftUI

class CartManager: ObservableObject {
    @Published var cartItems: [MovieModel] = []

    var itemCount: Int {
        return cartItems.count
    }
    
    func addToCart(movie: MovieModel) {
        if !cartItems.contains(where: { $0.id == movie.id }) {
            cartItems.append(movie)
        }
    }

    func removeFromCart(movie: MovieModel) {
        cartItems.removeAll { $0.id == movie.id }
    }

    func isInCart(movie: MovieModel) -> Bool {
        return cartItems.contains(where: { $0.id == movie.id })
    }
}

