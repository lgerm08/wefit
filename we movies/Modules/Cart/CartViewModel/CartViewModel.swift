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
}
