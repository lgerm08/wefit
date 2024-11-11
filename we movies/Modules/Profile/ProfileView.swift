//
//  ProfileView.swift
//  we movies
//
//  Created by Lucas Germano on 09/11/24.
//

import SwiftUI

struct ProfileView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text(AppStrings.profileMessage)
                    .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                    .fontWeight(.bold)
                    .foregroundColor(Color.primaryColor)
                
                Image(AppStrings.Images.emptyCartImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width*178.63/360, height: UIScreen.main.bounds.height*343/800)
                
                CustomButton(title: AppStrings.backToHomeButton, action: goBackToHome)
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
        selectedTab = 1
    }
}
