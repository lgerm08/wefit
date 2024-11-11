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
    private var movieHistory: [Int: Date] = [:] 
    
    var itemCount: Int {
        return cartItems.count
    }
    
    var uniqueCartItems: [MovieModel] {
        let uniqueItems = Dictionary(grouping: cartItems, by: { $0.id })
            .compactMap { $0.value.first }
        return uniqueItems
    }
    
    func movieQuantity(movie: MovieModel) -> Int {
        return cartItems.count(where: { $0.id == movie.id })
    }
    
    func addToCart(movie: MovieModel) {
        cartItems.append(movie)
        
        movieHistory[movie.id] = Date()
    }
    
    func removeAllOccurrencesFromCart(movie: MovieModel) {
        cartItems.removeAll { $0.id == movie.id }
        movieHistory.removeValue(forKey: movie.id) 
    }
    
    func removeOneOccurrenceFromCart(movie: MovieModel) {
        if let index = cartItems.firstIndex(where: { $0.id == movie.id }) {
            cartItems.remove(at: index)
        }
        
        movieHistory[movie.id] = nil
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
        movieHistory.removeAll()
    }
    
    func getLastAddedDate(movie: MovieModel) -> String {
        if let date = movieHistory[movie.id] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        }
        return ""
    }

}

