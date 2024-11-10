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
    
    var body: some View {
        VStack {
            if cartManager.cartItems.isEmpty {
                EmptyStateView(selectedTab: $selectedTab)
            } else {
                CartItemsView(cartItems: cartManager.cartItems, cartManager: cartManager)
            }
        }
        .navigationTitle("Carrinho")
    }
    
    // Simulação do método fetchData que atualiza os dados (aqui você pode implementar a lógica de rede)
    func fetchData() {
        // Exemplo de ação para recarregar a página. No seu caso, pode chamar a API.
        print("Recarregando a página...")
    }
}

// MARK: - EmptyStateView
struct EmptyStateView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("Parece que não há nada por aqui :(")
                .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                .fontWeight(.bold)
                .foregroundColor(Color.primaryColor)
            
            Image("empty_state_image")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width*178.63/360, height: UIScreen.main.bounds.height*343/800) // Ajuste o tamanho da imagem conforme necessário
            
            CustomButton(title: "Voltar à Home", action: goBackToHome)
        }
        .frame(width: UIScreen.main.bounds.width * 0.87,
               height: UIScreen.main.bounds.height * 0.73)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    // Navegar de volta à Home
    func goBackToHome() {
        selectedTab = 1
    }
}

// MARK: - CartItemsView
struct CartItemsView: View {
    let cartItems: [MovieModel]
    @ObservedObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            Text("Itens no Carrinho")
                .font(.custom(AppFonts.regular, size: FontSizes.headerTitle))
                .fontWeight(.bold)
                .foregroundColor(Color.primaryColor)
            
            List {
                ForEach(cartItems) { movie in
                    HStack {
                        Text(movie.title)
                            .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                            .foregroundColor(Color.primaryColor)
                        Spacer()
                        Button(action: {
                            cartManager.removeFromCart(movie: movie)
                        }) {
                            Text("Remover")
                                .foregroundColor(.red)
                        }
                        .frame(width: 173*UIScreen.main.bounds.width/360, height: 40)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.87,
               height: UIScreen.main.bounds.height * 0.73)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// MARK: - CustomButton
struct CustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                .foregroundColor(Color.secondaryColor)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
        .padding()
    }
}
