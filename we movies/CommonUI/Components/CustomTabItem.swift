//
//  CustomTabView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//


import SwiftUI

struct CustomTabItem: View {
    @Binding var selectedTab: Int
    let tabIndex: Int
    let text: String
    let imageName: String
    
    var body: some View {
        ZStack {
            if selectedTab == tabIndex {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.secondaryColor,
                                Color.secondaryColor.opacity(0.0)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 4)
                    .padding(.top, 2)
                    .padding(.horizontal, -8)
            }
            VStack(spacing: 4) {
                // Ícone e texto da aba
                Image(imageName)
                    .tint(Color.secondaryColor)
                Text(text)
                    .foregroundColor(Color.secondaryColor)
                    .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                
            }
            .padding(.vertical, 8)
            .onTapGesture {
                selectedTab = tabIndex
            }
        }
    }
}
