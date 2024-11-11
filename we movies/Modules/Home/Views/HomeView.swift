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
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            switch viewModel.state {
            case .loading:
                LoadingHomeView()
            case .empty:
                EmptyStateHomeView(action: reloadMoviesList)
            case .success(let movies):
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Text(AppStrings.bestSellers)
                            .foregroundColor(Color.secondaryColor)
                            .font(.custom(AppFonts.regular, size: FontSizes.subtitle))
                            .fontWeight(.bold)
                        
                        Text(AppStrings.mostSuccessful)
                            .foregroundColor(Color.secondaryColor)
                            .font(.custom(AppFonts.regular, size: FontSizes.smallText))
                            .fontWeight(FontWeights.bold)
                        
                        ForEach(movies) { movie in
                            MovieCard(movie: movie, cartManager: viewModel.cartManager)
                        }
                    }
                }
            }
        }
    }
    
    func reloadMoviesList() {
        viewModel.fetchMovies()
    }
    
}
