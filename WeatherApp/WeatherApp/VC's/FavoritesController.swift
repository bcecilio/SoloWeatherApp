//
//  FavoritesController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class FavoritesController: UIViewController {
    
    private let favoriteView = FavoritesView()
    
    private var favoritedPhotos = [Picture]() {
        didSet {
            favoriteView.tableView.reloadData()
        }
    }
    
    private let favoritePicturesPersistance = DataPersistence<Picture>(filename: "favoritedImages.plist")
    
    public var dataPersistance: DataPersistence<Picture>!
    
    override func loadView() {
        view = favoriteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        loadFavoritePictures()
    }
    
    private func loadFavoritePictures() {
        do {
            favoritedPhotos = try favoritePicturesPersistance.loadItems()
        } catch {
            print("error loading completed events: \(error)")
        }
    }
}

//extension FavoritesController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}

extension FavoritesController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was saved")
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was not saved")
    }
}
