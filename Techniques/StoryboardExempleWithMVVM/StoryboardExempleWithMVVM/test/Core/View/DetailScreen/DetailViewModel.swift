//
//  DetailViewModel.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 9.04.2023.
//

import Foundation

protocol DetailViewModelInterFace {
    var view: DetailViewInterace? { get set }
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailViewInterace?
}

extension DetailViewModel: DetailViewModelInterFace {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
