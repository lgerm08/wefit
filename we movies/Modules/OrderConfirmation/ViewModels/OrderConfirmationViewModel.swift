//
//  OrderConfirmationViewModel.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//
import Foundation

class OrderConfirmationViewModel: ObservableObject {
    
    func getTimeOfPurchase() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: Date())
            
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            let timeString = timeFormatter.string(from: Date())
            
            return "Compra realizada em **\(dateString)** às **\(timeString)**"
        }
}