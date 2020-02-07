//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    public func configureCell(weatherData: DailyDatum) {
        highLabel.text = "High: \(weatherData.temperatureHigh.description)"
        lowLabel.text = "Low: \(weatherData.temperatureLow.description)"
        dateLabel.text = weatherData.time.convertDate()
        if weatherData.temperatureHigh > 55.0 {
            weatherImageView.image = UIImage(named: "clear-day")
        } else if weatherData.temperatureHigh < 55.0 {
            weatherImageView.image = UIImage(named: "cloudyn")
        }
    }
}
