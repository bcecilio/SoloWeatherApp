//
//  DetailController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit
import DataPersistence

class DetailController: UIViewController {
    
    let popUpView = PopUpView()
    let visualEffectView = UIVisualEffectView()
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeView))
    var screenEffect: UIVisualEffect?
    var detailData: DailyDatum!
    var detailImage: Picture!
    
    public var dataPersistence: DataPersistence<Picture>!

    override func viewDidLoad() {
        super.viewDidLoad()
        view = popUpView
//        popUpView.addGestureRecognizer(tapGesture)
        updateUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(saveImageButtonPressed(_:)))
//        popUpView.visualEffectView.bounds = self.view.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        if touch?.view == popUpView {
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    private func updateUI() {
                guard let data = detailData else {
                    print("data no found hehehe")
                    return
                }
                guard let photo = detailImage else {
                    print("no image in detail")
                    return
                }
        popUpView.sunriseLabel.text = String(data.sunriseTime)
        popUpView.highLow.text = "High: \(data.temperatureHigh) Low: \(data.temperatureLow)"
        popUpView.sunsetLabel.text = String(data.sunsetTime)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
//    private func updateUI() {
//        guard let data = detailData else {
//            print("data no found hehehe")
//            return
//        }
//        guard let photo = detailImage else {
//            print("no image in detail")
//            return
//        }
//        placenameLabel.text = data.summary
//        sunriseLabel.text = "Sundrise: \(data.sunriseTime.description)"
//        sunsetLabel.text = "Sunset: \(data.sunsetTime.description)"
//        highLabel.text = "High: \(data.temperatureHigh.description)"
//        lowLabel.text = "Low: \(data.temperatureLow.description)"
//        windspeedLabel.text = "Windspeed: \(data.windSpeed.description)"
//        imageView.getImage(with: photo.largeImageURL) { [weak self] (result) in
//            switch result {
//            case .failure(_):
//                DispatchQueue.main.async {
//                    self?.imageView.image = UIImage(systemName: "cloud.drizzle.fill")
//                }
//            case .success(let image):
//                DispatchQueue.main.async {
//                    self?.imageView.image = image
//                }
//            }
//        }
//    }
    
    @objc private func saveImageButtonPressed(_ sender: UIBarButtonItem) {
        guard let savedImage = detailImage else {
            return
        }
        do {
            try dataPersistence.createItem(savedImage)
        } catch {
            print("error saving: \(error)")
        }
    }
    
    public func animateView(desiredView: UIView) {
//            let backgroundView = self.view
            // attach our desired view to the screen
            view.addSubview(desiredView)
            // sets the view's scaling to be 120%
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1.0
        }
    }
    
}

extension Double {
    func convertDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
    func convertTime() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}
