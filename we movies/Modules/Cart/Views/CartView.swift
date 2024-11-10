//
//  CartView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//
import SwiftUI

struct CartView: View {
    @ObservedObject var cartManager: CartManager
    @Binding var selectedTab: Int
    @Binding var finishedPurchase: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                Text("Carrinho de compras")
                    .font(.custom(AppFonts.regular, size: FontSizes.headerTitle))
                    .fontWeight(FontWeights.heavy)
                    .foregroundColor(Color.secondaryColor)
                
                if cartManager.cartItems.isEmpty {
                    EmptyStateCartView(selectedTab: $selectedTab)
                } else {
                    ProductsListView(cartManager: cartManager, finishedPurchase: $finishedPurchase)
                }
            }
            .padding()
        }
        .navigationTitle("Carrinho")
    }
}





