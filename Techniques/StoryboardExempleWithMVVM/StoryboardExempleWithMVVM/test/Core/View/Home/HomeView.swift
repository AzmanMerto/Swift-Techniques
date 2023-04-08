//
//  HomeView.swift
//  StoryboardExempleWithMVVM
//
//  Created by NomoteteS on 7.04.2023.
//

import UIKit

//Way7: View
protocol HomeViewInterface: AnyObject {
    func configureVC() // viewModel da view e set yapmak için
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToDetailView(movie: MovieResult)
}

final class HomeView: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.view = self  // viewModel daki view eşitledik
        viewModel.viewDidLoad() // viewModel daki fonksiyonu çalıştırdık
    }
}

extension HomeView: HomeViewInterface {
    
    func configureVC() {
        view.backgroundColor = .systemPink
        title = "Moviess 🐥"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false // Story board ile uğraşmaz isek bunu kullanıyoruz
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
        
        collectionView.pinToEdgeOf(view: view) // Tüm ekranı kaplamak için
    }
    
    func reloadCollectionView() {
        self.collectionView.reloadOnMainThread()
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    // kaç item dönecek
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movies.count
    }
    // item cell olarak list
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        
        return cell
    }
    // item seçilince
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }
    // scroll sonuna gelince yeni liste ekle 
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY >= contentHeight - (2 * height) {
            viewModel.getMovies()
        }
    }
    // navigate işlemi için
    func navigateToDetailView(movie: MovieResult) {
        DispatchQueue.main.async {
            let detailScreen = DetailView(movie: movie)
            self.navigationController?.pushViewController(detailScreen, animated: true)
        }
    }
}
