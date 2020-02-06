//
//  DetailController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placenameLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    var detailData: DailyDatum!
    
    var detailImage: Picture!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
        sunriseLabel.text = "Sundrise: \(data.sunriseTime.description)"
        sunsetLabel.text = "Sunset: \(data.sunsetTime.description)"
        highLabel.text = "High: \(data.temperatureHigh.description)"
        lowLabel.text = "Low: \(data.temperatureLow.description)"
        windspeedLabel.text = "Windspeed: \(data.windSpeed.description)"
        imageView.getImage(with: photo.largeImageURL) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(systemName: "cloud.drizzle.fill")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
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
