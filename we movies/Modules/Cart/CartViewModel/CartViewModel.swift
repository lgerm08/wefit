//
//  CartViewModel.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 09/11/24.
//
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems: [MovieModel] = []
    @Published var isLoading = false
    
    private let apiClient = APIClient.shared

    func fetchData() {
        isLoading = true
        apiClient.fetchData(endpoint: "YOUR_API_ENDPOINT") { (result: Result<Products, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let movieResponse):
                    self.cartItems = movieResponse.products
                case .failure(let error):
                    print("Erro ao carregar dados: \(error)")
                }
                self.isLoading = false
            }
        }
    }
}
