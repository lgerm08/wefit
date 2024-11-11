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
    @State var finishedPurchase: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            TabView(selection: $selectedTab) {
                
                if !finishedPurchase {
                    CartView(cartManager: cartManager, selectedTab: $selectedTab, finishedPurchase: $finishedPurchase)
                        .tabItem {
                            CustomTabItem(selectedTab: $selectedTab, tabIndex: 0, text: AppStrings.cart + (cartManager.itemCount <= 0 ? "" : " (\(cartManager.itemCount))"), imageName: AppStrings.Images.shoppingCart)
                        }
                        .tag(0)
                } else {
                    OrderConfirmationView(selectedTab: $selectedTab, finishedPurchased: $finishedPurchase)
                        .tabItem {
                            CustomTabItem(selectedTab: $selectedTab, tabIndex: 0, text: AppStrings.cart + (cartManager.itemCount <= 0 ? "" : " (\(cartManager.itemCount))"), imageName: AppStrings.Images.shoppingCart)
                        }
                        .tag(0)
                }
                
                
                HomeView(cartManager: cartManager)
                    .tabItem {
                        CustomTabItem(selectedTab: $selectedTab, tabIndex: 1, text: AppStrings.home, imageName: AppStrings.Images.home)
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        CustomTabItem(selectedTab: $selectedTab, tabIndex: 2, text: AppStrings.profile, imageName: AppStrings.Images.user)
                    }
                    .tag(2)
            }
            .tint(Color.secondaryColor)
            .onAppear() {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(Color.primaryColor)
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .background(Color.backgroundColor)
    }
    
}
