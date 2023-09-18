//
//  WeatherManager.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//

import Foundation

struct WeatherManager {
    
    let geocodeUrl = "https://api.openweathermap.org/geo/1.0/direct?limit=1&appid=96a358ba84055f23ad5d08c50c035e1a"
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=96a358ba84055f23ad5d08c50c035e1a&units=metric"
    
    func fetchGeocode(cityName: String) {
        let urlStr = "\(geocodeUrl)&q=\(cityName)"
        
        performRequest(urlStr: urlStr, urlType: "geo")
        
        
    }
    
    func performRequest(urlStr: String, urlType: String) {
        // 1. Create URL
        if let url = URL(string: urlStr) {
            // 2. Create a session
            let session = URLSession(configuration: .default)
            // 3. Create a task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(data: safeData, type: urlType)
                }
            }
            // 4. Perform the task
            task.resume()
        }
    }
    
    func parseJSON(data: Data, type: String) {
        let decoder = JSONDecoder()
        if type == "geo" {
            do {
                let decodedGeoData = try decoder.decode(GeoData.self, from: data)
                print("lat: \(decodedGeoData.lat)\(decodedGeoData.lon)")
            } catch {
                print(error)
            }
            
        } else if type == "weather" {
            do {
                let decodedWeatherData = try decoder.decode(WeatherData.self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func fetchWeather(cityName: String) {
        fetchGeocode(cityName: cityName)
    }
}
