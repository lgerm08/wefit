//
//  SplashScreen.swift
//  we movies
//
//  Created by Lucas Germano on 09/11/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            // Fundo da Splash Screen
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // Conteúdo principal
            VStack(alignment: .leading) {
                Text(AppStrings.welcomeMessage)
                    .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                    .foregroundColor(.white)
                    .bold()
                
                Text(AppStrings.appName)
                    .font(.custom(AppFonts.regular, size: FontSizes.splashScreenTitle))
                    .foregroundColor(.white)
                    .bold()
            }
            
            
            // Círculo inferior esquerdo
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.2), Color.circleGradient.opacity(0.2)]),
                    startPoint: .center,
                    endPoint: .topTrailing
                ))
                .frame(width: UIScreen.main.bounds.width * (296 / 360))
                .position(x: 0, y: UIScreen.main.bounds.height)
            
            // Círculo superior direito
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.2), Color.circleGradientColor.opacity(0.2)]),
                    startPoint: .center,
                    endPoint: .bottomLeading
                ))
                .frame(width: UIScreen.main.bounds.width * (296 / 360))
                .position(
                    x: UIScreen.main.bounds.width*(1 + (56/360)),
                    y: -(122/800)*UIScreen.main.bounds.width * (296 / 360)
                )
        }
        .onAppear {
            // Define o atraso de transição da splash screen para a home
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            CustomAppBarView() // Navega para a tela principal após a splash
        }
    }
}


