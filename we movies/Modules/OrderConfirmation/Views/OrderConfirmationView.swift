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
                Text(AppStrings.boughtAt)
                    .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                    .foregroundColor(Color.lightGray)
                + Text(viewModel.getDayOfPurchase())
                    .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                    .foregroundColor(Color.lightGray)
                    .fontWeight(.bold) // Usar .fontWeight(.bold) ao invés de .bold()
                + Text(AppStrings.at)
                    .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                    .foregroundColor(Color.lightGray)
                + Text(viewModel.getTimeOfPurchase())
                    .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                    .foregroundColor(Color.lightGray)
                    .fontWeight(.bold) // Usar .fontWeight(.bold) ao invés de .bold()

                Text(AppStrings.successfulPurchase)
                    .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                    .fontWeight(.bold)
                    .foregroundColor(Color.primaryColor)
                
                Image(AppStrings.Images.finishedPurchase)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width*178.63/360, height: UIScreen.main.bounds.height*343/800)
                
                CustomButton(title: AppStrings.backToHomeOrderButton, action: goBackToHome)
            }
            .frame(width: UIScreen.main.bounds.width * 0.87,
                   height: UIScreen.main.bounds.height * 0.73)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
    
    func goBackToHome() {
        finishedPurchased = false
        selectedTab = 1
    }
}
