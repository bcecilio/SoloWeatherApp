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
//        highLabel.text = weatherData.temperatureHigh.description
//        lowLabel.text = weatherData.temperatureLow.description
        dateLabel.text = "02/03"
    }
}
