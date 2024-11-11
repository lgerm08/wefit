//
//  APIClient.swift
//  we movies
//
//  Created by Lucas Germano on 09/11/24.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    let baseUrl = "https://wefit-movies.vercel.app/api"
    
    func fetchData<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseUrl + endpoint) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

