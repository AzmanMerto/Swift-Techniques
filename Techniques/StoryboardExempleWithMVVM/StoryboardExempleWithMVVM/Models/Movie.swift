//
//  Movie.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 7.04.2023.
//

import Foundation
//Way3: Set Model
struct Movie: Decodable {
    let result: [MovieResult]?
}

struct MovieResult: Decodable {
    let id: Int?
    let posterPath: String?
        
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
