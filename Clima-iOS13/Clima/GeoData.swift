//
//  GeoData.swift
//  Clima
//
//  Created by 李茜 on 17/9/23.
//
//  An object to get hold of data downloaded from Openweather API

import Foundation

struct GeoData: Codable {
    let name: String
    let lat: Double
    let lon: Double
}
