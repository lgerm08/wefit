//
//  CustomButton.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//

import SwiftUI

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
