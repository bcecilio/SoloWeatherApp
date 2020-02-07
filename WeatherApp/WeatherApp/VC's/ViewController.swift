//
//  ViewController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class ViewController: UITabBarController {
    
    private let dataPersistence = DataPersistence<Picture>(filename: "savedImages.plist")
    
    private lazy var weatherVC: WeatherController = {
        let VC = WeatherController()
        VC.dataPersistence = dataPersistence
        VC.tabBarItem = UITabBarItem(title: "Weather Forecast", image: UIImage(named: "cloud.sun.rain"), tag: 0)
        return VC
    }()
    
    private lazy var favoritesVC: FavoritesController = {
        let VC = FavoritesController()
        VC.dataPersistance = dataPersistence 
        VC.tabBarItem = UITabBarItem(title: "Favorite Images", image: UIImage(named: "bookmark"), tag: 1)
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
