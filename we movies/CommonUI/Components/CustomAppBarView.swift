//
//  CustomAppBarView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//

import SwiftUI

struct CustomAppBarView: View {
    @StateObject var cartManager = CartManager()
    @State private var selectedTab: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            TabView(selection: $selectedTab) {
                
                CartView(cartManager: cartManager, selectedTab: $selectedTab)
                    .tabItem {
                        Image("shopping_cart")
                        Text("Carrinho" + (cartManager.itemCount <= 0 ? "" : " (\(cartManager.itemCount))"))
                            .foregroundColor(Color.secondaryColor)
                            .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    }
                    .tag(0)
                
                HomeView(cartManager: cartManager)
                    .tabItem {
                        Image("home")
                        Text("Home")
                            .foregroundColor(Color.secondaryColor)
                            .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        Image("user")
                        Text("Perfil")
                            .foregroundColor(Color.secondaryColor)
                            .font(.custom(AppFonts.regular, size: FontSizes.navBarItem))
                    }
                    .tag(2)
            }
            .onAppear() {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(Color.primaryColor)
                appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.secondaryColor)
                appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor:  UIColor(Color.secondaryColor)]
                appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.secondaryColor)
                appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor:  UIColor(Color.secondaryColor)]
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .background(Color.backgroundColor)
    }
    
}
