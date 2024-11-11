//
//  CartViewModel.swift
//  we movies
//
//  Created by Lucas Germano on 09/11/24.
//
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartItems: [MovieModel] = []
    @Published var isLoading = false
}
