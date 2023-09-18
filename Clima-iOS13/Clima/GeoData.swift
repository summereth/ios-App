//
//  GeoData.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//

import Foundation

class GeoData: OpenWeatherData, Decodable {
    let name: String
    let lat: Double
    let lon: Double
}
