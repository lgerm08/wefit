//
//  CartItemsCard.swift
//  we movies
//
//  Created by Lucas Germano on 10/11/24.
//
import SwiftUI

struct CartItemsCard: View {
    var item: MovieModel
    @StateObject var cartManager: CartManager
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: item.image)) { image in
                    image.resizable()
                        .frame(width: 80, height: 120)
                        .cornerRadius(8)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title)
                        .foregroundColor(Color.primaryColor)
                        .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    Text("$\(item.price, specifier: "%.2f")")
                        .foregroundColor(Color.primaryColor)
                        .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    Text(AppStrings.addDate)
                            .foregroundColor(Color.unfocusedGray)
                            .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                            .fontWeight(.light)
                         + Text(cartManager.getLastAddedDate(movie: item))
                            .foregroundColor(Color.unfocusedGray)
                            .fontWeight(.bold)
                            .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                }
                
                Spacer()
                
                Button(action: {
                    cartManager.removeAllOccurrencesFromCart(movie: item)
                }) {
                    Image(AppStrings.Images.trashIcon)
                }
            }
            
            HStack(spacing: 8) {
                QuantityControlView(cartManager: cartManager, movie: item)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(AppStrings.partialPrice)
                        .foregroundColor(Color.lightGray)
                        .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    Text("R$ \(item.price * Double(cartManager.cartItems.filter{ $0.id == item.id}.count), specifier: "%.2f")")
                        .foregroundColor(Color.primaryColor)
                        .fontWeight(FontWeights.bold)
                        .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                }
            }
        }
    }
}
