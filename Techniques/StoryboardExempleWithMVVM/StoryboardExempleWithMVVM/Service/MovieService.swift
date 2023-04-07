//
//  MovieService.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 7.04.2023.
//

import Foundation

class MovieService {
    //Way4: Service
    func downloadMovies(completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e2883b87a542986d7ea2df12dada6b58&language=en-US&page=1") else { return }
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
}
