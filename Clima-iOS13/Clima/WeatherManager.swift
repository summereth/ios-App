//
//  WeatherManager.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherData: WeatherModel)
    func didUpdateGeo(_ location: GeoData)
}


struct WeatherManager {
    
    let geocodeUrl = "https://api.openweathermap.org/geo/1.0/direct?limit=1&appid=96a358ba84055f23ad5d08c50c035e1a"
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=96a358ba84055f23ad5d08c50c035e1a&units=metric"
    
    var deletgate: WeatherManagerDelegate?
    
    func fetchWeatherByCityName(cityName: String){
        let urlStr = "\(geocodeUrl)&q=\(cityName)"
        
        performRequest(with: urlStr, urlType: "geo")
        
    }
    
    func performRequest(with urlStr: String, urlType: String) {

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
                    if urlType == "geo" {
                        if let geoData = self.parseGeoJSON(safeData) {
                            // to do: how to pass geoData
                            self.deletgate?.didUpdateGeo(geoData)
                        }
                    } else if urlType == "weather" {
                        if let weather = self.parseWeatherJSON(safeData) {
                            self.deletgate?.didUpdateWeather(weather)
                        }
                    }
                }
            }
            // 4. Perform the task
            task.resume()
        }
    }
    
    func parseGeoJSON(_ data: Data) -> GeoData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedGeoData = try decoder.decode([GeoData].self, from: data)
            if !decodedGeoData.isEmpty {
                return decodedGeoData[0]
            }
        } catch {
            print(error)
        }
        return nil
    }
        
    func parseWeatherJSON(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedWeatherData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedWeatherData.weather[0].id
            let temp = decodedWeatherData.main.temp
            let name = decodedWeatherData.name
            
            let weather = WeatherModel(conditionId: id, temperature: temp, cityName: name)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
                      
//
//
//    func fetchWeatherByCityName(cityName: String) {
//        fetchGeocode(cityName: cityName)
//        // to do: get geocode and fetchWeatherByGeo
//    }
    
    func fetchWeatherByGeo(lat: Double, lon: Double) {
        let urlStr = "\(weatherUrl)&lat=\(lat)&lon=\(lon)"
        
        performRequest(with: urlStr, urlType: "weather")
    }
}
