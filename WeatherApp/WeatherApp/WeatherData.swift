//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let time: Double
    let currently: [Currently]
}

struct Currently: Codable {
    let temperature, apparentTemperature, dewPoint, humidity: Double
}
