//
//  EmptyStateHomeView.swift
//  we movies
//
//  Created by Lucas Germano on 10/11/24.
//

import SwiftUI

struct EmptyStateHomeView: View {
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(AppStrings.emptyProductsMessage)
                .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                .fontWeight(.bold)
                .foregroundColor(Color.primaryColor)
            
            Image(AppStrings.Images.emptyStateHome)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width*178.63/360, height: UIScreen.main.bounds.height*343/800)
            
            CustomButton(title: AppStrings.reloadButton, action: action)
        }
        .frame(width: UIScreen.main.bounds.width * 0.87,
               height: UIScreen.main.bounds.height * 0.73)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(Spacing.padding)
    }
    
}

