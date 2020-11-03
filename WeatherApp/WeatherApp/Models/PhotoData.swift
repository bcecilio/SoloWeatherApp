//
//  PhotoData.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/6/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PictureHits: Codable {
    let hits: [Picture]
}
struct Picture: Codable, Equatable {
    let largeImageURL: String
}
