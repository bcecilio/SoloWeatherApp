//
//  ViewController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    private lazy var weatherVC: WeatherController = {
        let VC = WeatherController()
        VC.tabBarItem = UITabBarItem(title: "Weather Forecast", image: UIImage(named: "Cloud-Drizzle-Sun"), tag: 0)
        return VC
    }()
    
    private lazy var favoritesVC: FavoritesController = {
        let VC = FavoritesController()
        VC.tabBarItem = UITabBarItem(title: "Favorite Images", image: UIImage(named: "icons8-favorites"), tag: 1)
        return VC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabButtons()
    }
    
    private func setUpTabButtons() {
        viewControllers = [weatherVC, favoritesVC]
    }

}
