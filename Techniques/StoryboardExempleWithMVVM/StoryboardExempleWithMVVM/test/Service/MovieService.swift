//
//  MovieService.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 7.04.2023.
//

import Foundation

class MovieService {
    //Way4: Service
    func downloadMovies(page: Int, completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movies(page: page)) else { return }
        //Way4.1: Get data from json and escaping
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(id: Int, completion: @escaping (MovieResult?) -> ()) {
        guard let url = URL(string: APIURLs.detail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                completion(self.handleWithData(success))
            case .failure(let failure):
                self.handleWithError(failure)
            }
        }
    }
    
     private func handleWithError(_ error: Error) {
        print("FIXto MovieService handleWithError: \(error.localizedDescription)")
    }
    //Way4.2: Set data to Model
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.result
        } catch {
            print("FIXto MovieService handleWithData: \(error.localizedDescription)")
            return nil
        }
    }
    
    private func handleWithData(_ data: Data) -> MovieResult? {
        do {
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
        } catch  {
            print(error)
            return nil
        }
    }
}
