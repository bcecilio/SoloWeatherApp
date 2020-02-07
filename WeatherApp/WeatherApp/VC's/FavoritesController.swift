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
            favoriteView.collectionView.reloadData()
        }
    }
    
    public var dataPersistance: DataPersistence<Picture>!
    
    override func loadView() {
        view = favoriteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        favoriteView.collectionView.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
        favoriteView.collectionView.dataSource = self
        favoriteView.collectionView.delegate = self
        loadFavoritePictures()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        loadFavoritePictures()
    }
    
    private func loadFavoritePictures() {
        do {
            favoritedPhotos = try dataPersistance.loadItems()
        } catch {
            print("error loading completed events: \(error)")
        }
    }
}

extension FavoritesController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritedPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoriteView.collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? FavoritesCell else {
            fatalError("could not downcast FavoritesCell")
        }
        let image = favoritedPhotos[indexPath.row]
        cell.configureCell(for: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemHeight: CGFloat = maxSize.height * 0.20
        let itemWidth: CGFloat = maxSize.width
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension FavoritesController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was saved")
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        print("item was not saved")
    }
}
