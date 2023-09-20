//
//  WeatherData.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//
//  An object to get hold of data downloaded from Openweather API

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
