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
    
    var uniqueCartItems: [MovieModel] {
            let uniqueItems = Dictionary(grouping: cartItems, by: { $0.id })
                .compactMap { $0.value.first }
            return uniqueItems
    }
    
    func movieQuantity(movie: MovieModel) -> Int {
        return cartItems.count(where: {$0.id == movie.id})
    }
    
    func addToCart(movie: MovieModel) {
        cartItems.append(movie)
    }
    
    func removeAllOcurrencesFromCart(movie: MovieModel) {
        cartItems.removeAll { $0.id == movie.id }
    }
    
    func removeOneOccurrenceFromCart(movie: MovieModel) {
        if let index = cartItems.firstIndex(where: { $0.id == movie.id }) {
            cartItems.remove(at: index)
        }
    }
    
    func isInCart(movie: MovieModel) -> Bool {
        return cartItems.contains(where: { $0.id == movie.id })
    }
    
    func totalPrice() -> String {
        let total = cartItems.reduce(0) { $0 + $1.price }
        return String(format: "%.2f", total)
    }
    
    func cleanCart() {
        cartItems.removeAll()
    }

}

