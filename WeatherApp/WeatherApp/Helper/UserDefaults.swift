//
//  UserDefaults.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 8/1/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

enum Location: String {
    case location = "Saved"
}

struct UserPreference {
    static let location = "location"
}

class UserSettings {
    
    private init() {}
    
    private let standard = UserDefaults.standard
    
    static let shared = UserSettings()
    
    func updateUserLocation(with location: Location) {
        
        standard.set(location.rawValue, forKey: UserPreference.location)
    }
}
