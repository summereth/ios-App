//
//  WeatherModel.swift
//  Clima
//
//  Created by 李茜 on 18/9/23.
//
//  A weather object which correspond a weather condition. It's not the weather data downloaded from Openweather API

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temperature: Double
    let cityName: String
    
    var tempStr: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
        }
    }
}
