//
//  HeaderView.swift
//  we movies
//
//  Created by Lucas Germano on 09/11/24.
//
import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text(AppStrings.appName)
                .foregroundColor(.white)
                .font(.custom(AppFonts.regular, size: FontSizes.headerTitle))
        }
        .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * (73 / 800))
        .background(Color.primaryColor)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * (73 / 800))
    }
}

