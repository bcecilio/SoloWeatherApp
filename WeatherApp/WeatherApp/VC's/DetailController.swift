//
//  DetailController.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var placenameLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    private var detailData: DailyDatum!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        guard let data = detailData else {
            print("data no found hehehe")
            return
        }
        sunriseLabel.text = data.sunriseTime.description
        sunsetLabel.text = data.sunsetTime.description
        highLabel.text = data.temperatureHigh.description
        lowLabel.text = data.temperatureLow.description
    }
}
