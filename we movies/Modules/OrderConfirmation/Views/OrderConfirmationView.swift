//
//  OrderConfirmationView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//

import SwiftUI

struct OrderConfirmationView: View {
    @StateObject private var viewModel = OrderConfirmationViewModel()
    @Binding var selectedTab: Int
    @Binding var finishedPurchased: Bool
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text(viewModel.getTimeOfPurchase())
                    .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                    .foregroundColor(Color.lightGray)
                Text("Compra realizada com sucesso!")
                    .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                    .fontWeight(.bold)
                    .foregroundColor(Color.primaryColor)
                
                Image(AppStrings.Images.finishedPurchase)
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
    }
    
    // Navegar de volta à Home
    func goBackToHome() {
        finishedPurchased = false
        selectedTab = 1
    }
}
