//
//  WeatherController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class WeatherController: UIViewController {
    
    @IBOutlet weak var placenameLabel: UILabel!
    
    let visualEffectView = UIVisualEffectView()
    
    private let weatherView = WeatherView()
    
    private var photos = [Picture]()
    
    public var dataPersistence: DataPersistence<Picture>!
    
    var weatherData = [DailyDatum]() {
        didSet {
            DispatchQueue.main.async {
                self.weatherView.collectionView.reloadData()
            }
        }
    }
    var zipcodeQuery = "" {
        didSet {
            UserDefaults.standard.set(zipcodeQuery, forKey: "zipcodeQuery")
            loadData(zipcodeQuery: zipcodeQuery)
        }
    }
    
    override func loadView() {
        view = weatherView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        visualEffectView.effect = nil
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        navigationItem.title = "Weather"
        weatherView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
        weatherView.collectionView.delegate = self
        weatherView.collectionView.dataSource = self
        weatherView.textField.delegate = self
        weatherView.textField.text = zipcodeQuery
        loadData(zipcodeQuery: zipcodeQuery)
        zipcodeQuery = UserDefaults.standard.object(forKey: "zipcodeQuery") as? String ?? "11372"
    }
    
    private func getWeather(lat: Double, long: Double) {
        WeatherAPIClient.getWeather(lat: lat, long: long) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let weather):
                self?.weatherData = weather.daily.data
            }
        }
    }
    
    public func loadPhotos(photos: String) {
        WeatherAPIClient.getPhotos(photos: photos) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let photos):
                DispatchQueue.main.async {
                    self?.photos = photos
                }
            }
        }
    }

    
    public func loadData(zipcodeQuery: String) {
        ZipCodeHelper.getLatLong(fromZipCode: zipcodeQuery) { [weak self] (result) in
            switch result {
            case .failure(let fetchingError):
                print("\(fetchingError)")
            case .success(let location):
                self?.getWeather(lat: location.lat, long: location.long)
                self?.loadPhotos(photos: location.placeName)
                DispatchQueue.main.async {
                    self?.loadPhotos(photos: location.placeName)
                }
            }
        }
    }
    
}

extension WeatherController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
            fatalError("could not dequeue WeatherCell")
        }
        let weatherCell = weatherData[indexPath.row]
        cell.configureCell(weatherData: weatherCell)
        cell.layer.cornerRadius = 7
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 1.0
        return CGSize(width: itemWidth - 100, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailController()
//        self.addChild(detailVC)
//        detailVC.view.frame = self.view.frame
//        self.view.addSubview(detailVC.view)
//        detailVC.didMove(toParent: self)
//        guard let detailVC = detailStoryboard.instantiateViewController(identifier: "DetailController") as? DetailController else {
//            fatalError("could not downcast to DETAILCONTROLLER")
//        }
        let aPicture = photos[indexPath.row]
        detailVC.detailImage = aPicture
        detailVC.dataPersistence = dataPersistence
        detailVC.detailData = weatherData[indexPath.row]
//        detailVC.transition(from: WeatherController(), to: detailVC, duration: 0.4, options: .transitionCrossDissolve, animations: nil, completion: nil)
        detailVC.modalTransitionStyle = .crossDissolve
        detailVC.modalPresentationStyle = .overCurrentContext
//        animateBlur()
        present(detailVC, animated: true)
    }
}

extension WeatherController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let zipcode = textField.text else {
            loadData(zipcodeQuery: zipcodeQuery)
            return true
        }
        zipcodeQuery = zipcode
        return true
    }
}
