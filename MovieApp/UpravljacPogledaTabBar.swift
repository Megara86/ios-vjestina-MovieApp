//
//  UpravljacPogledaTabBar.swift
//  MovieApp
//
//  Created by endava-bootcamp on 04.05.2023..
//
import Foundation
import UIKit
import PureLayout
import MovieAppData

class UpravljacPogledaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieController = MovieCategoryViewController()
        
        let favouritesController =  FavoritesViewController()
        
        
        self.setViewControllers([
            createTabBarItem(tabBarTitle: "Home", tabBarImage: UIImage(systemName: "house")!, viewController: movieController),
            createTabBarItem(tabBarTitle: "Favorites", tabBarImage: UIImage(systemName: "star")!, viewController: favouritesController)
        ], animated: false)
    }
    
    fileprivate func createTabBarItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
          let navigationController = UINavigationController(rootViewController: viewController)

          navigationController.navigationBar.tintColor = .black
          navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
          
          let appearance = UINavigationBarAppearance()
          appearance.configureWithOpaqueBackground()
          navigationController.navigationBar.standardAppearance = appearance
          navigationController.navigationBar.scrollEdgeAppearance = appearance
          
          navigationController.tabBarItem = UITabBarItem(title: tabBarTitle, image: tabBarImage, selectedImage: tabBarImage)
          
          return navigationController
      }
}
