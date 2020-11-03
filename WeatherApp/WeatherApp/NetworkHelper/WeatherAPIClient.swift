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
    static func getWeather(lat: Double, long: Double, completion: @escaping (Result<Weather, AppError>) -> ()) {
        let endpointURL = "https://api.darksky.net/forecast/\(SecretKeys.appKey)/\(lat),\(long)"
        
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
                    let data = try JSONDecoder().decode(Weather.self, from: data)
                    let weatherData = data
                    completion(.success(weatherData))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func getPhotos(photos: String, completion: @escaping (Result<[Picture], AppError>) -> ()) {
        
        let photoString = photos.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let endpointURL = "https://pixabay.com/api/?key=\(SecretKeys.pictureKey)&q=\(photoString ?? "11372")"
        
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
                    let data = try JSONDecoder().decode(PictureHits.self, from: data)
                    completion(.success(data.hits))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
