//
//  NetworkManager.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 7.04.2023.
//

import Foundation

//Way2: networkManagering
class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func download(url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
           //Way2.1 :Check error
            if let error = error {
                print("FIXto NetworkManager error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            //Way2.2: Check response if it is 200
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                print("FIXto NetworkManager response")
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            //Way2.3: get data
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                print("FIXto NetworkManager data")
                return
            }
            completion(.success(data))
        }
    }
}
