//
//  MovieCard.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//
import SwiftUI

struct MovieCard: View {
    let movie: MovieModel
    @ObservedObject var cartManager: CartManager

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.image)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                
                Text("$\(movie.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    if cartManager.isInCart(movie: movie) {
                        cartManager.removeFromCart(movie: movie)
                    } else {
                        cartManager.addToCart(movie: movie)
                    }
                }) {
                    Text(cartManager.isInCart(movie: movie) ? "Adicionado" : "Adicionar ao Carrinho")
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(cartManager.isInCart(movie: movie) ? Color.green : Color.blue)
                        .cornerRadius(8)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
