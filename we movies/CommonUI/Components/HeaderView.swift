//
//  HeaderView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.width * (73 / 360)  
            VStack {
                Text(AppStrings.appName)
                    .foregroundColor(.white)
                    .font(.custom(AppFonts.regular, size: FontSizes.headerTitle))
                    .frame(width: geometry.size.width, height: height)
                    .background(Color.primaryColor)
                    .edgesIgnoringSafeArea(.top)
            }
        }
        .frame(height: UIScreen.main.bounds.width * (73 / 360))
    }
}

