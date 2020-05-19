//
//  TabBarController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 14/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeViewController = HomeViewController()
    let packageViewController = PackageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpItens()
        let tabBarList = [homeViewController, packageViewController]
        viewControllers = tabBarList
    }
    
    func setUpItens(){
        
        homeViewController.tabBarItem = UITabBarItem(title: "procurar", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle"))
        packageViewController.tabBarItem = UITabBarItem(title: "pacotes", image: UIImage(systemName: "briefcase"), selectedImage: UIImage(systemName: "briefcase"))
    }
    
}
