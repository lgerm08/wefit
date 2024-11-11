//
//  CartButton.swift
//  we movies
//
//  Created by Lucas Germano on 10/11/24.
//

import SwiftUI

struct CartButton: View {
    @ObservedObject var cartManager: CartManager
    var movie: MovieModel
    
    var body: some View {
        Button(action: {
            if cartManager.isInCart(movie: movie) {
                cartManager.removeAllOccurrencesFromCart(movie: movie)
            } else {
                cartManager.addToCart(movie: movie)
            }
        }) {
            HStack(spacing: 6) {
                Image(AppStrings.Images.addCart)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                    Text("\(cartManager.movieQuantity(movie: movie))")
                        .foregroundColor(.white)
                        .padding(.leading, 6)
                
                Text(AppStrings.cartButton)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                
            }
            .padding()
            .background(cartManager.isInCart(movie: movie) ? Color.greenButtonColor : Color.accentColor)
            .cornerRadius(4)
            .padding(EdgeInsets(top: 11, leading: 43, bottom: 11, trailing: 43))
        }
    }
}

