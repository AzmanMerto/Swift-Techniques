//
//  MovieCell.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 8.04.2023.
//

import UIKit
//WAY9: 
class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MoviewCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil // arkadaki cell silinmesini sağlıyor
        posterImageView.cancelDownloading()
    }
    
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
    
    private func configureCell() {
        backgroundColor = .systemCyan
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
                
        posterImageView.pinToEdgeOf(view: self)
    }
}
