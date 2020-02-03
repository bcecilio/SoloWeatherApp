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
    
    public func configureCell() {
        weatherImageView.image = UIImage(systemName: "cloud.drizzle")
        highLabel.text = "High: 100"
        lowLabel.text = "Low: 40"
        dateLabel.text = "02/03"
    }
}
