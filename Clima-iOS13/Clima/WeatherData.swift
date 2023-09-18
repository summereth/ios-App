//
//  WeatherData.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//

import Foundation

class WeatherData: OpenWeatherData, Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let main: String
    let description: String
}
