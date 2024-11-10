//
//  HomeViewModel.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//

import SwiftUI
import Combine

enum HomeState {
    case loading
    case empty
    case success([MovieModel])
}


class HomeViewModel: ObservableObject {
    @Published var state: HomeState = .loading
    @ObservedObject var cartManager: CartManager
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMovies() {
        let endpoint = "https://wefit-movies.vercel.app/api/movies" // Insira seu endpoint real aqui
        
        APIClient.shared.fetchData(endpoint: endpoint) { (result: Result<Products, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.state = response.products.isEmpty ? .empty : .success(response.products)
                case .failure(let error):
                    print("Erro ao buscar filmes: \(error)")
                    self.state = .empty
                }
            }
        }
    }
    
    init(cartManager: CartManager) {
        self.cartManager = cartManager
        fetchMovies()
    }
}
