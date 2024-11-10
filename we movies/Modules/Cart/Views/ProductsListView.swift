//
//  ProductsListView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//
import SwiftUI

struct ProductsListView: View {
    @ObservedObject var cartManager: CartManager
    @Binding var finishedPurchase: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(cartManager.uniqueCartItems.sorted(by: { $0.title < $1.title }), id: \.id) { item in
                    CartItemsCard(item: item, cartManager: cartManager)
                    Divider()
                }
                
                HStack {
                    Text("TOTAL")
                        .foregroundColor(Color.lightGrayColor)
                        .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                        .fontWeight(.bold)
                    Spacer()
                    var total = cartManager.totalPrice()
                    Text("R$ \(total)")
                        .foregroundColor(Color.primaryColor)
                        .font(.custom(AppFonts.regular, size: FontSizes.headerTitle))
                        .fontWeight(.bold)
                }
                
                CustomButton(title: "Finalizar Compra") {
                    cartManager.cleanCart()
                    finishedPurchase = true
                }
            }
            .padding()
            .background(Color.white)  // Cor de fundo branca
            .cornerRadius(4)
            .shadow(radius: 5)
        }
        .background(Color.backgroundColor)  // Garante que o fundo da ScrollView seja branco
    }
}
