//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let daily: Daily
}

struct Daily: Codable {
    let summary: String
    let data: [DailyDatum]
}

struct DailyDatum: Codable {
    let timezone: String?
    let time: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let summary, icon: String
    let sunriseTime, sunsetTime: Int
    let moonPhase, precipIntensity, precipIntensityMax: Double
    let windSpeed: Double
}

