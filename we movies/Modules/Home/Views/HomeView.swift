//
//  HomeView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    
    init(cartManager: CartManager) {
        _viewModel = StateObject(wrappedValue: HomeViewModel(cartManager: cartManager))
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .empty:
                Text("Nada encontrado")
            case .success(let movies):
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Mais Vendidos")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Maiores sucessos do WeMovie")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        ForEach(movies) { movie in
                            MovieCard(movie: movie, cartManager: viewModel.cartManager)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Home")
    }
}
