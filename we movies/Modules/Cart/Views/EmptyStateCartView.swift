//
//  EmptyStateCartView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//
import SwiftUI

struct EmptyStateCartView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Text("Parece que não há nada por aqui :(")
                .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                .fontWeight(.bold)
                .foregroundColor(Color.primaryColor)
            
            Image("empty_state_cart_image")
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
