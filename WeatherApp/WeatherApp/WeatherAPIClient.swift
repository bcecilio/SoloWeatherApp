//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct WeatherAPIClient {
    static func getWeather(zipCodeQuery: String, completion: @escaping (Result<[Weather], AppError>) -> ()) {
        let endpointURL = "https://api.darksky.net/forecast/9fb817c1de2067d841b72f0f5757717f/\(zipCodeQuery)"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode([Weather].self, from: data)
                    let weatherData = data
                    completion(.success(weatherData))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
