//
//  MainTabBarViewController.swift
//  Netflix Clone
//
//  Created by Kamilla Mylena Teixeira Antunes on 09/09/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private let navigationsControllers = [UINavigationController(rootViewController: HomeViewController()),
                                          UINavigationController(rootViewController: UpComingViewController()),
                                          UINavigationController(rootViewController: SearchViewController()),
                                          UINavigationController(rootViewController: DownloadsViewController())]
    
    private let icons = [(iconName: "house", titleName: "Home"),
                         (iconName:"play.circle", titleName: "Coming"),
                         (iconName:"magnifyingglass", titleName: "Top Searchs"),
                         (iconName:"arrow.down.to.line", titleName: "Downloads")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .label
        
        for i in 0...navigationsControllers.count - 1 {
            navigationsControllers[i].tabBarItem.image = UIImage(systemName: icons[i].iconName)
            navigationsControllers[i].title = icons[i].titleName
        }
        
        setViewControllers(navigationsControllers, animated: true)
    }
}

