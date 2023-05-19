//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 25.04.2023..
//

import Foundation
import UIKit
import PureLayout
import MovieAppData

protocol Coordinator {

    func start()
}

class MovieCategoryViewController: UIViewController {
    
    var tableView: UITableView!
    let movies = MovieUseCase().allMovies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Movie List"
        
        view.isUserInteractionEnabled = true

        buildViews()
    }
    
    @objc func collectionCellClicked() {
//        self.navigationController?.popViewController(animated: true)
        
//        let vc = MovieDetailsViewController()
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        tableView = UITableView()
        view.addSubview(tableView)

    }
    
    private func styleViews() {
        tableView.register(MovieCategoryCollection.self, forCellReuseIdentifier: MovieCategoryCollection.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
    }
    private func defineLayoutForViews() {
        tableView.autoPinEdge(toSuperviewSafeArea: .top)
        tableView.autoPinEdge(toSuperviewSafeArea: .bottom)
        tableView.autoPinEdge(toSuperviewSafeArea: .leading)
        tableView.autoPinEdge(toSuperviewSafeArea: .trailing)
    }
}

extension MovieCategoryViewController:UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCategoryCollection.identifier ,for:
                indexPath) as? MovieCategoryCollection else {
                fatalError("Table view cannot dequeue a customcell")
            }

            if(indexPath.row == 0){
                let movieCollection = MovieUseCase().popularMovies
                let name = "What's popular"
            
                cell.setCategory(movies: movieCollection, name: name)
            }else if(indexPath.row == 1){
                let movieCollection = MovieUseCase().freeToWatchMovies
                let name = "Free to watch"
                cell.setCategory(movies: movieCollection, name: name)
            }else{
                let movieCollection = MovieUseCase().trendingMovies
                let name = "Trending"
                cell.setCategory(movies: movieCollection, name: name)
            }
            
            cell.delegate = self
            
            return cell
        }
}

extension MovieCategoryViewController: MovieCategoryCollectionDelegate {
    func delegateFunction(id: Int) {
        let vc = MovieDetailsViewController(id:id)
        navigationController?.pushViewController(vc, animated: true)
    }
}
