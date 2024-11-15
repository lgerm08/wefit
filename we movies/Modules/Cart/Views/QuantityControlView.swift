//
//  QuantityControlView.swift
//  we movies
//
//  Created by Lucas Germano on 10/11/24.
//

import SwiftUI

struct QuantityControlView: View {
    @StateObject var cartManager: CartManager
    let movie: MovieModel
    
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                if cartManager.cartItems.contains(where: {$0.id == movie.id}) {
                    cartManager.removeOneOccurrenceFromCart(movie: movie)
                }
            }) {
                Image(AppStrings.Images.removeIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color.secondaryColor)
                    .cornerRadius(4)
            }
            
            Text("\(cartManager.movieQuantity(movie: movie))")
                .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                .frame(width: 30, alignment: .center)
                .padding(4)
                .background(Color.secondaryColor)
                .foregroundColor(Color.primaryColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.lightGray, lineWidth: 1)
                )
            
            Button(action: {
                cartManager.addToCart(movie: movie)
            }) {
                Image(AppStrings.Images.addIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
                    .background(Color.secondaryColor)
                    .cornerRadius(4)
            }
        }
    }
}

