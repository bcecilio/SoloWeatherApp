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
    let daily: Daily
}

struct Currently: Codable {
    let temperature, apparentTemperature, dewPoint, humidity: Double
}

struct Daily: Codable {
    let summary: String
    let data: [DailyDatum]
}

struct DailyDatum: Codable {
    let temperatureHigh: Double
    let temperatureLow: Double
}

